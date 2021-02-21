variable "instance" {
  description = "creating reserved instances"
  type        = map(string)
  default     = {
    "t2.micro"  = "1"
    "t3.micro" = "2"
  }
}

