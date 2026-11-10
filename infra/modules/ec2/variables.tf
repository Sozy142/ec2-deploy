variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "instance_type" {
  description = "instance type"
  type = string
}

variable "subnet_id" {
  description = "the subnet instance launched"
  type = string
}

variable "ec2_sg" {
  description = "sg for ec2"
  type = list(string)
}

variable "key_name" {
  description = "key for ssh"
  type = string
}