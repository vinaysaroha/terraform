output "public_ip" {
  value = { for instance in aws_instance.instance1 : instance.id => instance.public_ip }
}
