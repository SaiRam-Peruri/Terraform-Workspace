terraform {
  backend "s3" {
    bucket         = "terraform-artifacts-v2"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}