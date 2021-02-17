module "account" {
  source = "git::https://gitlab.com/ids-inc/ids/account_services/_baseline.git//module"

  region      = var.region
  environment = var.environment

  vpc_cidr               = var.vpc["vpc_cidr"][0]
  vpc_availability_zones = var.vpc["avialability_zones"]
  vpc_private_subnets    = var.vpc["private_subnets"]
  vpc_public_subnets     = var.vpc["public_subnets"]
  vpc_database_subnets   = var.vpc["database_subnets"]

}

