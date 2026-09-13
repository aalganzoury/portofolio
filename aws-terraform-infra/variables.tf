###############################################################################
# variables.tf — Input variables for the lab-scaling infrastructure
###############################################################################

# ── AWS Region ──────────────────────────────────────────────────────────────
variable "aws_region" {
  description = "AWS region to deploy all resources into"
  type        = string
  default     = "us-east-1"
}

# ── VPC ─────────────────────────────────────────────────────────────────────
variable "vpc_cidr" {
  description = "CIDR block for the main VPC (lab-scaling-vpc)"
  type        = string
  default     = "10.0.0.0/16"
}

# ── Public Subnets ──────────────────────────────────────────────────────────
variable "public_subnet_a_cidr" {
  description = "CIDR block for Public Subnet in AZ A"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_b_cidr" {
  description = "CIDR block for Public Subnet in AZ B"
  type        = string
  default     = "10.0.3.0/24"
}

# ── Private Subnets ─────────────────────────────────────────────────────────
variable "private_subnet_a_cidr" {
  description = "CIDR block for Private Subnet in AZ A"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_b_cidr" {
  description = "CIDR block for Private Subnet in AZ B"
  type        = string
  default     = "10.0.4.0/24"
}

# ── EC2 / ASG ───────────────────────────────────────────────────────────────
variable "instance_type" {
  description = "EC2 instance type for the Auto Scaling Group launch template"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 key pair name (leave empty to skip SSH key)"
  type        = string
  default     = ""
}

variable "asg_desired" {
  description = "Desired number of EC2 instances in the ASG"
  type        = number
  default     = 2
}

variable "asg_min" {
  description = "Minimum number of EC2 instances in the ASG"
  type        = number
  default     = 1
}

variable "asg_max" {
  description = "Maximum number of EC2 instances in the ASG"
  type        = number
  default     = 4
}
