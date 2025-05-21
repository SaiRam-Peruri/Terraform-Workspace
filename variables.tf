variable "aws_region" {
  type    = string
  default = "us-west-1"
}

variable "vpc_name" {
  type    = string
  default = "terraform-vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "private_subnets" {
  default = {
    "terraform-private-subnet-1" = 1
    "terraform-private-subnet-2" = 2
    "terraform-private-subnet-3" = 3
  }
}

variable "public_subnets" {
  default = {
    "terraform-public-subnet-1" = 1
    "terraform-public-subnet-2" = 2
    "terraform-public-subnet-3" = 3
  }
}