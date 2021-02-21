# resource "aws_instance" "my_instance" {
#     instance_type = "${var.instance_type}"
#     ami = "${data.aws_ami.centos.id}"
#     availability_zone = "${data.aws_availability_zones.availability_zone.names[1]}"
#     tags = "${map("Name", "my_instance")}"
#     key_name = "${aws_key_pair.my_key.key_name}"
#     vpc_security_group_ids = ["${aws_security_group.sg_ssh.id}"]
#     subnet_id = "${module.vpc.public_subnet.1.id}"
# }

# resource "aws_key_pair" "my_key" { #this will have the key pairs for the instances
#     key_name = "${var.key_name}"
#     public_key = "${file(~/.ssh/id_rsa.pub)}"
#     tags = "${map("Name", "my_keypair")}"
# }

# resource "aws_security_group" "sg_ssh" {
#     name = "sg_ssh"
#     description = "ssh"
#     vpc_id = "${aws_vpc.my_vpc.id}"
#     tags = "${map("Name", "ssh")}"

#     ingress {
#         from_port = 22
#         to_port = 22
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
#     egress {
#         from_port = 0
#         to_port = 0
#         protocol = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
# }

data "aws_availability_zones" "availability_zone" {}

data "aws_ami" "centos" {
  most_recent = true
  owners      = ["679593333241"]
  filter {
    name   = "state"
    values = ["available"]
  }
  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "my_instance" {
    for_each = "${var.instance}"
    instance_type = "${each.key}"
    ami = "ami-0e999cbd62129e3b1"
    availability_zone = "${data.aws_availability_zones.availability_zone.names[1]}"
    tags = "${map("Name", "my_instance")}"
}

output instance {
  value = [for k, u in aws_instance.my_instance:u.instance_type]
}

# locals{
#     instance = { for v in var.instance : v => v }
# }