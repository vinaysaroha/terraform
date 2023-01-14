output "public_ip" {
    value = aws_instance.instance1.public_ip
}

output "ec2-public-dns" {
    value = aws_instance.instance1.public_dns
}