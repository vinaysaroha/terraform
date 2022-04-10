variable "aws_secret_key" {
}

variable "aws_access_key_id" {
}

variable "region" {
  default =  "ap-southeast-2"
}

variable "ssh_pub_key" {
  default = "ssh_key.pub"
}

variable "user_name" {
  default = "ec2-user"
}

variable "ssh_private_key" {
  default = "ssh_key"
}

