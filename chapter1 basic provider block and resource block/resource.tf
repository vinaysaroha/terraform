resource "aws_instance" "instance1" {
  ami           = "ami-08e637cea2f053dfa"
  instance_type = "t2.micro"
  user_data     = file("${path.module}/userdata.sh")
  tags = {
    "Name" = "Webserver"
  }
  key_name = aws_key_pair.ssh-key.id
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key"
  public_key = file("ssh-keys/ssh-key.pub")
}

output "public_ip" {
  value = aws_instance.instance1.public_ip
}

resource "aws_security_group" "sg1" {
    name = "Terraform security group"
    
  
}