output "listing_ec2_type" {
  value = [for az in data.aws_ec2_instance_type_offerings.my-support-instance-type: az.instance_types]
}

output "mapping_ec2_types" {
  value = {
    for az, type in data.aws_ec2_instance_type_offerings.my-support-instance-type: az => type.instance_types if length(type.instance_types) != 0
  }
}