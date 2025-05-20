terraform {
  backend "s3" {
    bucket         = "terraform-artifacts-v2"
    key            = "state/terraform.tfstate"
    region         = "us-west-1"
    encrypt        = true
  }
}