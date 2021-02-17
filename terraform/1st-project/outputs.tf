output "environment" {
  value = module.account.environment
}

output "vpc_id" {
  value = module.account.vpc_id
}

output "private_subnets" {
  value = module.account.private_subnets
}

output "public_subnets" {
  value = module.account.public_subnets
}

output "database_subnets" {
  value = module.account.database_subnets
}

output "route53_private_zone_id" {
  value = module.account.route53_private_zone_id
}

output "security_groups" {
  value = module.account.security_groups
}
