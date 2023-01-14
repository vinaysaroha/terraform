resource "aws_instance" "instance1" {
    ami = data.aws_ami.redhat9.id
    instance_type = var.aws_instance_type_list[0]
    user_data = file("${path.module}/userdata.sh")
    key_name = aws_key_pair.ssh-key.id
    security_groups = [ aws_security_group.sg1.name ]
    count = 2  # tell me total how many instaces you want to create
    tags = {
      "Name" = "Webserver-${count.index}"  # create tags as per instances like Webserver-1 Webserver-2 
    }
}

resource "aws_key_pair" "ssh-key" {
    key_name = "ssh-key"
    public_key = file(var.instance_pub_key)
}

