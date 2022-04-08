resource "aws_key_pair" "ssh_key" {
  key_name = "ssh_key"
  public_key = file(var.ssh_pub_key)
}


resource "aws_instance" "instance1" {
  instance_type = "t2.micro"
  ami = "ami-0a443decce6d88dc2"
  key_name = aws_key_pair.ssh_key.key_name
  
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh",  # Remove the spurious CR characters.
      "sudo /tmp/script.sh",
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.user_name
    private_key = file(var.ssh_private_key)
  }
}

# if you want any output related to any resource use output module 
output "public_ip" {
  value = aws_instance.instance1.public_ip
}