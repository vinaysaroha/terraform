resource "aws_instance" "instance1" {
    ami = data.aws_ami.redhat9.id
    instance_type = var.aws_instance_type_map["dev"]
    user_data = file("${path.module}/userdata.sh")
    tags = {
      "Name" = "Webserver${each.key}"
    }
    key_name = aws_key_pair.ssh-key.id
    security_groups = [ aws_security_group.sg1.name ]
    for_each = toset(data.aws_availability_zones.my-az.names)
    availability_zone = each.value
}

resource "aws_key_pair" "ssh-key" {
    key_name = "ssh-key"
    public_key = file(var.instance_pub_key)
}

