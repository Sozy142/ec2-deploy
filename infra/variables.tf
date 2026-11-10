variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "aws_lab"
}

variable "vpc_cidr" {
  description = "vpc cidr"
  type        = string
}

variable "public_subnets" {
  type        = list(string)
  description = "cidr block for public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "cidr block for private subnets"
}

variable "allowed_ssh_cidr" {
  description = "allowed shh cidr"
  type        = list(string)
}