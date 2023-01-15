data "aws_ami" "redhat9" {
  most_recent      = true
  owners           = ["amazon"] # check the source first name when you search that ami id in aws in public place 

  filter {
    name   = "name"
    values = ["RHEL-9.1.0_HVM-*-GP2"]  # pass the ami id in amis under aws public ami from there you can see the ami name  
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_availability_zones" "my-az" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_ec2_instance_type_offerings" "my-support-instance-type" {
  for_each = toset(data.aws_availability_zones.my-az.names)
  filter {
    name   = "instance-type"
    values = ["t1.micro"]
  }

  filter {
    name   = "location"
    # values = ["us-east-1a"]
    values = [each.value]
  }
  location_type = "availability-zone"
}