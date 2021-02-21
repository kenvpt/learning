variable "os_type" {
    description = "os type you choose (windows or linux)"
    default = "Linux/UNIX"
}

variable "availability_zone" {
    description = "the availability zone"
    default = "us-east-1a"
}

variable "end_date" {
    description = "the end date of the reserved instance (ex:1985-04-12T23:20:50.52Z)(YYYY-MM-DDTHH:MM:SSZ)"
    default = "2022-02-17T23:20:50.52Z"
}


variable "ec2_capacity_reservation" {
  description = "creating reserved instances"
  type        = map(string)
  default     = {
    "t2.micro"  = "1"
    "t3.micro" = "2"
  }
}

# locals{
#     ec2_capacity_reservation = { for v in var.ec2_capacity_reservation : v => v }
# }
 