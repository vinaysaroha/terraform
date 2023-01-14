output "public_ip" {
    value = [for instance in aws_instance.instance1: instance.public_ip]
}