variable "aws_default_region" {
  description = "AWS Default Region"
  default     = "eu-west-1"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.10.0.0/16"
}

variable "aws_region_zone_a" {
  description = "Avalibility Zone for Zone A Networks"
  default     = "a"
}

variable "frontend_subnet_cidr_a" {
  description = "CIDR for frontend (public) subnet for Zone A"
  default     = "10.10.11.0/24"
}

variable "ami_ubuntu" {
  description = "Base AMI wth which to launch default ubuunt 18.10 instances with"

  default = {
    eu-west-1    = "ami-004702ac36e50e4d9"
    eu-central-1 = "ami-07b410cd4c13e4e7b"
    us-east-1    = "ami-0ae682b6002e9bfc5"
    us-west-1    = "ami-0017375fe077db2f7"
    us-west-2    = "ami-021702b92d9025550"
  }
}