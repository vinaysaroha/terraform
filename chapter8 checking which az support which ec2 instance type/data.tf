data "aws_ec2_instance_type_offerings" "my-support-instance-type" {
  filter {
    name   = "instance-type"
    values = ["t1.micro"]
  }

  filter {
    name   = "location"
    # values = ["us-east-1a"]
    values = data.aws_availability_zones.list-az.names
  }
  location_type = "availability-zone"
}

data "aws_availability_zones" "list-az" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
