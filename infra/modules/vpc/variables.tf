variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "public subnet cidr block"
  type = list(string)
}

variable "private_subnets" {
  description = "private subnet cidr block"
  type        = list(string)
}

variable "allowed_ssh_cidr" {
  description = "allowed shh cidr"
  type = list(string)
}
