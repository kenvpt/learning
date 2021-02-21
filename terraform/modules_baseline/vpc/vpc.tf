provider "aws" {
  region = var.region
}

resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc["vpc_cidr"][0]
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = map("Name", "${var.environment} VPC")
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    count = length(var.vpc["public_subnet"][*])
    cidr_block = element(var.vpc["public_subnet"],count.index)
    map_public_ip_on_launch = true
    availability_zone = element(data.aws_availability_zones.availability_zone.names,count.index)
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    count = length(var.vpc["private_subnet"][*])
    cidr_block = element(var.vpc["private_subnet"],count.index)
    map_public_ip_on_launch = true
    availability_zone = element(data.aws_availability_zones.availability_zone.names,count.index)
}

data "aws_availability_zones" "availability_zone" {}

output subnets {
  value       = "${local.all_subnets}"
  sensitive   = false
  description = "description"
}

output availability_zone {
  value       = "${data.aws_availability_zones.availability_zone.names}"
  sensitive   = false
  description = "description"
}

output availability_zones {
  value       = "${data.aws_availability_zones.availability_zone}"
  sensitive   = false
  description = "description"
}
