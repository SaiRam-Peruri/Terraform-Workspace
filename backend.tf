terraform {
  backend "s3" {
    bucket         = "terraform-artifacts-sairam-2025"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}