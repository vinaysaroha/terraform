output "public_ip" {
  value = { for c, instance in aws_instance.instance1 : c => instance.public_ip }
}
