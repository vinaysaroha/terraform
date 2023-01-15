output "public_ip_using_list" {
  value = toset([for instance in aws_instance.instance1: instance.public_ip])
}

output "public_ip_using_map" {
  value = tomap({for az, instance in aws_instance.instance1: az => instance.public_ip})
}