resource "aws_instance" "instance1" {
    ami = data.aws_ami.redhat9.id
    instance_type = var.instance_type
    user_data = file("${path.module}/userdata.sh")
    tags = {
      "Name" = "Webserver"
    }
    key_name = aws_key_pair.ssh-key.id
    security_groups = [ aws_security_group.sg1.name ]
}

resource "aws_key_pair" "ssh-key" {
    key_name = "ssh-key"
    public_key = file(var.instance_pub_key)
}

