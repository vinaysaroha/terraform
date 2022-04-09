terraform {
  backend "s3" {
      bucket = "terraform-complete-course"
      key = "terraform/"
  }
}