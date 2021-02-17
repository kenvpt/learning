variable "vpc"{
    description = "the vpc infrastructure"
    type = map(list(string))

    default = {
    vpc_cidr           = ["10.0.0.0/16"]
    public_subnets     = ["10.0.0.0/24", "10.0.0.0/16", "10.0.0.0/16"]
    private_subnets    = ["10.0.0.0/16", "10.0.0.0/16", "10.0.0.0/24"]
    database_subnets   = ["10.0.0.0/24", "10.0.0.0/24","10.0.0.0/24"]
    availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  }
}
