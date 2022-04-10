# if we want to value of the resource which is already in aws and use the value of that resource in your terraform code that using data source you can use that .

data "aws_vpc" "test" {
  default = true
}


output "vpc_detail" {
  value = data.aws_vpc.test.id
}
