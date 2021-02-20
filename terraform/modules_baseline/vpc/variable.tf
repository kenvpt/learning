variable "region"{
    description = "specific region"
}

variable "vpc"{
    type = map(list(string))
    default = {
        vpc_cidr = ["10.0.0.0/16"]
        public_subnet = ["10.1.0.0/24","10.2.0.0/24","10.3.0.0/24"]
    }
}



