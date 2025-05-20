terraform {
  backend "s3" {
    bucket  = "terraform-artifacts-sairam-2025"
    key     = "state/terraform.tfstate"
    region  = "us-west-1"
    encrypt = true
  }
}