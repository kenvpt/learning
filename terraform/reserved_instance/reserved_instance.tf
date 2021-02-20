resource "aws_ec2_capacity_reservation" "default" {
  for_each = var.ec2_capacity_reservation
  instance_platform = "${var.os_type}"
  availability_zone = "${var.availability_zone}"
  end_date = "${var.end_date}"
  instance_type = "${each.key}"
  instance_count = "${each.value}"
}

