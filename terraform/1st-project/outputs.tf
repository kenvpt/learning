output "environment" {
  value = module.vpc.environment
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "database_subnets" {
  value = module.vpc.database_subnets
}

output "route53_private_zone_id" {
  value = module.vpc.route53_private_zone_id
}

output "security_groups" {
  value = module.vpc.security_groups
}
