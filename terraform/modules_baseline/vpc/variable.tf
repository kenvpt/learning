variable "customer_name" {
    description = "name of the customer"
    default = "ids"
}

variable "environment"{
    description = "dev,test,pre-pod,prod"
    default = "dev"
}
variable "region"{
    description = "specific region"
    default = "us-west-2"
}

variable "vpc"{
    type = map(list(string))
    default = {
        "vpc_cidr" = ["192.168.0.0/16"]
        "public_subnet"= ["192.168.1.0/24","192.168.2.0/24","192.168.3.0/24"]
        "private_subnet" = ["192.168.11.0/24","192.168.12.0/24","192.168.13.0/24"]
    }
}

locals {
    all_subnets = concat(aws_subnet.public_subnet.*.id,aws_subnet.private_subnet.*.id)
}


