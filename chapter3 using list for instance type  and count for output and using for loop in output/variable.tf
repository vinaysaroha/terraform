variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_pub_key" {
  type    = string
  default = "ssh-keys/ssh-key.pub"
}

variable "aws_instance_type_list" {
  type = list(string)
  default = [ "t2.micro","t1.micro" ]
}
