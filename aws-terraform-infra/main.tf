###############################################################################
# Provider
###############################################################################
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

###############################################################################
# Data Sources — fetch latest Amazon Linux 2 AMI and available AZs
###############################################################################
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

###############################################################################
# 1. VPC — lab-scaling-vpc (10.0.0.0/16)
###############################################################################
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "lab-scaling-vpc"
  }
}

###############################################################################
# 2. Internet Gateway — attached to VPC
###############################################################################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "lab-igw"
  }
}

###############################################################################
# 3. Public Subnets (AZ A & AZ B)
###############################################################################
resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_a_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-a"
    Tier = "public"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_b_cidr
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-b"
    Tier = "public"
  }
}

###############################################################################
# 4. Private Subnets (AZ A & AZ B)
###############################################################################
resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_a_cidr
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "private-subnet-a"
    Tier = "private"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_b_cidr
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "private-subnet-b"
    Tier = "private"
  }
}

###############################################################################
# 5. Elastic IP for NAT Gateway
###############################################################################
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "nat-eip"
  }

  depends_on = [aws_internet_gateway.igw]
}

###############################################################################
# 6. NAT Gateway — placed in Public Subnet A only
###############################################################################
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "nat-gw"
  }

  depends_on = [aws_internet_gateway.igw]
}

###############################################################################
# 7. Public Route Table — routes 0.0.0.0/0 → IGW
###############################################################################
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

###############################################################################
# 8. Private Route Table — routes 0.0.0.0/0 → NAT Gateway
###############################################################################
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private.id
}

###############################################################################
# 9. Security Groups
###############################################################################

# ALB Security Group — allows inbound HTTP from the internet
resource "aws_security_group" "alb" {
  name        = "alb-sg"
  description = "Allow HTTP inbound to ALB"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-sg"
  }
}

# EC2 Security Group — allows inbound HTTP from ALB only
resource "aws_security_group" "ec2" {
  name        = "ec2-sg"
  description = "Allow HTTP from ALB only"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-sg"
  }
}

###############################################################################
# 10. Application Load Balancer — lab-alb (Internet-facing)
###############################################################################
resource "aws_lb" "alb" {
  name               = "lab-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = [aws_subnet.public_a.id, aws_subnet.public_b.id]

  enable_deletion_protection = false

  tags = {
    Name = "lab-alb"
  }
}

###############################################################################
# 11. Target Group — asg-tg (HTTP :80, health check on /health)
###############################################################################
resource "aws_lb_target_group" "asg_tg" {
  name     = "asg-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    enabled             = true
    path                = "/health"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }

  tags = {
    Name = "asg-tg"
  }
}

###############################################################################
# 12. ALB Listener — forwards HTTP :80 → Target Group
###############################################################################
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg_tg.arn
  }
}

###############################################################################
# 13. IAM Role for EC2 instances (SSM + CloudWatch)
###############################################################################
resource "aws_iam_role" "ec2_role" {
  name = "ec2-lab-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "ec2-lab-role"
  }
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "cloudwatch" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-lab-profile"
  role = aws_iam_role.ec2_role.name
}

###############################################################################
# 14. Launch Template — installs httpd, php, stress at boot
###############################################################################
resource "aws_launch_template" "web" {
  name          = "lab-web-lt"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  key_name      = var.key_name != "" ? var.key_name : null

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  network_interfaces {
    security_groups             = [aws_security_group.ec2.id]
    associate_public_ip_address = false
  }

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 8
      volume_type = "gp3"
      encrypted   = true
    }
  }

  user_data = base64encode(<<-USERDATA
    #!/bin/bash
    set -euxo pipefail

    yum update -y
    yum install -y httpd php stress

    # Create health-check endpoint
    echo "OK" > /var/www/html/health

    # Create a sample page
    cat > /var/www/html/index.html <<'HTML'
    <!DOCTYPE html>
    <html>
    <head><title>Lab Instance</title></head>
    <body>
      <h1>Hello from $(hostname)</h1>
      <p>Private IP: $(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)</p>
    </body>
    </html>
    HTML

    systemctl enable httpd
    systemctl start httpd
  USERDATA
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "lab-web-instance"
    }
  }

  tags = {
    Name = "lab-web-lt"
  }
}

###############################################################################
# 15. Auto Scaling Group — asg-private-web (Private Subnets A & B)
###############################################################################
resource "aws_autoscaling_group" "web" {
  name                = "asg-private-web"
  desired_capacity    = var.asg_desired
  min_size            = var.asg_min
  max_size            = var.asg_max
  vpc_zone_identifier = [aws_subnet.private_a.id, aws_subnet.private_b.id]
  target_group_arns   = [aws_lb_target_group.asg_tg.arn]

  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }

  tag {
    key                 = "Name"
    value               = "lab-web-instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

###############################################################################
# 16. Scaling Policies
###############################################################################

# --- Target Tracking: keep average CPU at 50% ---
resource "aws_autoscaling_policy" "target_tracking" {
  name                   = "asg-target-tracking-cpu"
  autoscaling_group_name = aws_autoscaling_group.web.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }
}

# --- Step Scaling: +1 instance at 50% CPU ---
resource "aws_autoscaling_policy" "step_50" {
  name                   = "asg-step-scale-50"
  autoscaling_group_name = aws_autoscaling_group.web.name
  policy_type            = "StepScaling"

  step_adjustment {
    metric_interval_lower_bound = 0
    metric_interval_upper_bound = 20
    scaling_adjustment          = 1
  }
}

# --- Step Scaling: +2 instances at 70% CPU ---
resource "aws_autoscaling_policy" "step_70" {
  name                   = "asg-step-scale-70"
  autoscaling_group_name = aws_autoscaling_group.web.name
  policy_type            = "StepScaling"

  step_adjustment {
    metric_interval_lower_bound = 0
    scaling_adjustment          = 2
  }
}

# CloudWatch alarm that triggers the step policies at 50% CPU
resource "aws_cloudwatch_metric_alarm" "cpu_50" {
  alarm_name          = "asg-cpu-above-50"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 50

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web.name
  }

  alarm_description = "Scale up when average CPU >= 50% for 2 minutes"
  alarm_actions     = [aws_autoscaling_policy.step_50.arn]
}

# CloudWatch alarm that triggers the step policies at 70% CPU
resource "aws_cloudwatch_metric_alarm" "cpu_70" {
  alarm_name          = "asg-cpu-above-70"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 70

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web.name
  }

  alarm_description = "Scale up when average CPU >= 70% for 2 minutes"
  alarm_actions     = [aws_autoscaling_policy.step_70.arn]
}
