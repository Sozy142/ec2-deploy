module "vpc" {
  source = "./modules/vpc"

  project_name     = var.project_name
  vpc_cidr         = var.vpc_cidr
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  allowed_ssh_cidr = var.allowed_ssh_cidr
}