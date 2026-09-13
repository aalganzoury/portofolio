# AWS Terraform Infrastructure — lab-scaling-vpc

Production-grade AWS infrastructure provisioned with Terraform: VPC, public/private subnets across two AZs, NAT Gateway, Application Load Balancer, and an Auto Scaling Group with target-tracking and step-scaling policies.

## Architecture

```
Internet
   │
   ▼
┌─────────────────────────────────────────────────────────┐
│  VPC  10.0.0.0/16                                       │
│                                                         │
│  ┌──────────────────────┐   ┌──────────────────────┐   │
│  │  Public Subnet A     │   │  Public Subnet B     │   │
│  │  10.0.1.0/24         │   │  10.0.3.0/24         │   │
│  │                      │   │                      │   │
│  │  ┌────────┐          │   │          ┌────────┐  │   │
│  │  │ NAT GW │◄──EIP    │   │          │        │  │   │
│  │  └────────┘          │   │          │  ALB   │  │   │
│  └──────────┬───────────┘   └───────────┼────────┘  │   │
│             │                           │           │   │
│  ┌──────────▼───────────┐   ┌───────────▼────────┐  │   │
│  │  Private Subnet A    │   │  Private Subnet B  │  │   │
│  │  10.0.2.0/24         │   │  10.0.4.0/24       │  │   │
│  │                      │   │                    │  │   │
│  │  ┌────────────────┐  │   │  ┌────────────────┐│  │   │
│  │  │ EC2 (ASG)      │  │   │  │ EC2 (ASG)      ││  │   │
│  │  └────────────────┘  │   │  └────────────────┘│  │   │
│  └──────────────────────┘   └────────────────────┘  │   │
└──────────────────────────────────────────────────────┘   │
```

## Resources Created

| Resource | Name | Description |
|----------|------|-------------|
| VPC | lab-scaling-vpc | 10.0.0.0/16 with DNS support |
| Internet Gateway | lab-igw | Attached to VPC |
| Public Subnet A | public-subnet-a | 10.0.1.0/24 — AZ A |
| Public Subnet B | public-subnet-b | 10.0.3.0/24 — AZ B |
| Private Subnet A | private-subnet-a | 10.0.2.0/24 — AZ A |
| Private Subnet B | private-subnet-b | 10.0.4.0/24 — AZ B |
| Elastic IP | nat-eip | Static IP for NAT Gateway |
| NAT Gateway | nat-gw | In Public Subnet A |
| Public Route Table | public-rt | Routes 0.0.0.0/0 → IGW |
| Private Route Table | private-rt | Routes 0.0.0.0/0 → NAT |
| ALB Security Group | alb-sg | Inbound HTTP :80 from internet |
| EC2 Security Group | ec2-sg | Inbound HTTP :80 from ALB only |
| ALB | lab-alb | Internet-facing, across public subnets |
| Target Group | asg-tg | HTTP :80, health check /health |
| Launch Template | lab-web-lt | Amazon Linux 2 + httpd + php + stress |
| Auto Scaling Group | asg-private-web | Across private subnets A & B |
| Target Tracking Policy | asg-target-tracking-cpu | 50% CPU target |
| Step Policy (+1) | asg-step-scale-50 | +1 instance at 50% CPU |
| Step Policy (+2) | asg-step-scale-70 | +2 instances at 70% CPU |

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) >= 1.5.0
- AWS CLI configured with valid credentials
- An existing EC2 key pair (optional, leave empty to skip)

## Quick Start

```bash
# 1. Clone the repository
git clone https://github.com/YOUR-USERNAME/aws-terraform-infra.git
cd aws-terraform-infra

# 2. Initialize Terraform
terraform init

# 3. Preview the plan
terraform plan

# 4. Apply the infrastructure
terraform apply

# 5. Get the ALB DNS name from the outputs
terraform output alb_dns_name

# 6. Open the ALB URL in your browser
# http://<ALB_DNS_NAME>
```

## Customization

Override defaults by creating a `terraform.tfvars` file or passing `-var` flags:

```hcl
# terraform.tfvars
aws_region        = "eu-west-1"
instance_type     = "t3.small"
asg_desired       = 3
asg_min           = 2
asg_max           = 10
key_name          = "my-key-pair"
```

Or inline:

```bash
terraform apply -var="instance_type=t3.small" -var="asg_max=6"
```

## Variable Reference

| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| `aws_region` | string | us-east-1 | AWS region |
| `vpc_cidr` | string | 10.0.0.0/16 | VPC CIDR block |
| `public_subnet_a_cidr` | string | 10.0.1.0/24 | Public Subnet A |
| `public_subnet_b_cidr` | string | 10.0.3.0/24 | Public Subnet B |
| `private_subnet_a_cidr` | string | 10.0.2.0/24 | Private Subnet A |
| `private_subnet_b_cidr` | string | 10.0.4.0/24 | Private Subnet B |
| `instance_type` | string | t3.micro | EC2 instance type |
| `key_name` | string | "" | EC2 key pair name |
| `asg_desired` | number | 2 | ASG desired capacity |
| `asg_min` | number | 1 | ASG minimum size |
| `asg_max` | number | 4 | ASG maximum size |

## Outputs

After `terraform apply`, the following values are displayed:

- `vpc_id` — VPC identifier
- `alb_dns_name` — DNS name of the load balancer
- `nat_gateway_public_ip` — Elastic IP of the NAT Gateway
- `asg_name` — Auto Scaling Group name
- `ec2_security_group_id` — EC2 security group (for reference)

## Testing the Deployment

1. **ALB health**: Open `http://<ALB_DNS>` in a browser — the sample page should load.
2. **Health check**: `curl http://<ALB_DNS>/health` should return `OK`.
3. **Stress test**: SSH into an instance and run `stress --cpu 4` to trigger scaling.
4. **Scaling**: Watch the ASG in the AWS Console → EC2 → Auto Scaling Groups.

## Cost Warning

This infrastructure creates billable AWS resources (NAT Gateway, ALB, EC2 instances). Run `terraform destroy` when finished to avoid ongoing charges:

```bash
terraform destroy
```

## Cleanup

```bash
terraform destroy -auto-approve
```

## License

This project is provided as-is for educational and portfolio purposes.
