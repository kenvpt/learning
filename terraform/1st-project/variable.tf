variable "vpc"{
    description = "the vpc infrastructure"
    type = map(list(string))

    default = {
    vpc_cidr           = ["172.19.49.0/24"]
    public_subnets     = ["172.19.49.0/27", "172.19.49.32/27", "172.19.49.64/27"]
    private_subnets    = ["172.19.49.96/27", "172.19.49.128/27", "172.19.49.160/27"]
    database_subnets   = ["172.19.49.192/27", "172.19.49.224/28", "172.19.49.240/28"]
    avialability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  }
}
