terraform {
  backend "s3" {
      bucket = "terraform-complete-course"
      key = "terraform/terraform_state_file"
  }
}