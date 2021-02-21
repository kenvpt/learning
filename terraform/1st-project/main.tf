module "vpc" {
  source = 

  region      = var.region
  environment = var.environment

  vpc_cidr               = var.vpc["vpc_cidr"][0]
  vpc_private_subnets    = var.vpc["private_subnets"]
  vpc_public_subnets     = var.vpc["public_subnets"]
}



