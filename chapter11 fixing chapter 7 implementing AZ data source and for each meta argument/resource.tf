resource "aws_instance" "instance1" {
    ami = data.aws_ami.redhat9.id
    instance_type = var.aws_instance_type_map["dev"]
    user_data = file("${path.module}/userdata.sh")
    tags = {
      "Name" = "Webserver${each.key}"
    }
    key_name = aws_key_pair.ssh-key.id
    security_groups = [ aws_security_group.sg1.name ]
    for_each = toset(keys({for az, type in data.aws_ec2_instance_type_offerings.my-support-instance-type: az => type.instance_types if length(type.instance_types) != 0}))
    availability_zone = each.value
}

resource "aws_key_pair" "ssh-key" {
    key_name = "ssh-key"
    public_key = file(var.instance_pub_key)
}

