output "get_list_az_support_instance_type" {
  value = data.aws_ec2_instance_type_offerings.my-support-instance-type.instance_types
}
