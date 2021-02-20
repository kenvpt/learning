provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "my_vpc" {
    cidr_block = "${var.vpc[vpc_id]}"
    enable_dns_hostnames = true
    enable_dns_support = true
}

resource "aws_subnet" "public_subnet" {
    vpc_id = "${aws_vpc.my_vpc.id}"
    count = "${var.vpc[public_subnet]}"
    cidr_block = "${element(var.vpc[public_subnet,count.index)}"
    map_public_ip_on_launch = true
    availability_zone = "${element(data.aws_availability_zones.availability_zone.names,count.index)}"
}

data "aws_availability_zones" "availability_zone" {}

