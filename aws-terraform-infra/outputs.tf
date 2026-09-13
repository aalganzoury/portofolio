###############################################################################
# outputs.tf — Key values exported after apply
###############################################################################

# ── VPC ─────────────────────────────────────────────────────────────────────
output "vpc_id" {
  description = "ID of the main VPC (lab-scaling-vpc)"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block of the main VPC"
  value       = aws_vpc.main.cidr_block
}

# ── Subnets ─────────────────────────────────────────────────────────────────
output "public_subnet_a_id" {
  description = "ID of Public Subnet A"
  value       = aws_subnet.public_a.id
}

output "public_subnet_b_id" {
  description = "ID of Public Subnet B"
  value       = aws_subnet.public_b.id
}

output "private_subnet_a_id" {
  description = "ID of Private Subnet A"
  value       = aws_subnet.private_a.id
}

output "private_subnet_b_id" {
  description = "ID of Private Subnet B"
  value       = aws_subnet.private_b.id
}

# ── Networking ──────────────────────────────────────────────────────────────
output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = aws_nat_gateway.nat.id
}

output "nat_gateway_public_ip" {
  description = "Public IP of the NAT Gateway (Elastic IP)"
  value       = aws_eip.nat.public_ip
}

output "public_route_table_id" {
  description = "ID of the Public Route Table"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "ID of the Private Route Table"
  value       = aws_route_table.private.id
}

# ── Security Groups ─────────────────────────────────────────────────────────
output "alb_security_group_id" {
  description = "ID of the ALB Security Group"
  value       = aws_security_group.alb.id
}

output "ec2_security_group_id" {
  description = "ID of the EC2 Security Group (allows traffic from ALB only)"
  value       = aws_security_group.ec2.id
}

# ── Load Balancer ───────────────────────────────────────────────────────────
output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.alb.arn
}

output "alb_dns_name" {
  description = "DNS name of the ALB — open in a browser to test"
  value       = aws_lb.alb.dns_name
}

output "alb_zone_id" {
  description = "Canonical hosted zone ID of the ALB (for Route 53 alias)"
  value       = aws_lb.alb.zone_id
}

output "target_group_arn" {
  description = "ARN of the Target Group (asg-tg)"
  value       = aws_lb_target_group.asg_tg.arn
}

# ── Auto Scaling Group ─────────────────────────────────────────────────────
output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.web.name
}

output "asg_arn" {
  description = "ARN of the Auto Scaling Group"
  value       = aws_autoscaling_group.web.arn
}

output "launch_template_id" {
  description = "ID of the Launch Template"
  value       = aws_launch_template.web.id
}

# ── Scaling Policies ────────────────────────────────────────────────────────
output "target_tracking_policy_arn" {
  description = "ARN of the Target Tracking scaling policy"
  value       = aws_autoscaling_policy.target_tracking.arn
}

output "step_policy_50_arn" {
  description = "ARN of the Step Scaling policy (+1 at 50% CPU)"
  value       = aws_autoscaling_policy.step_50.arn
}

output "step_policy_70_arn" {
  description = "ARN of the Step Scaling policy (+2 at 70% CPU)"
  value       = aws_autoscaling_policy.step_70.arn
}

# ── AMI ─────────────────────────────────────────────────────────────────────
output "ami_id" {
  description = "ID of the Amazon Linux 2 AMI used by the launch template"
  value       = data.aws_ami.amazon_linux.id
}
