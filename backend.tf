terraform {
  backend "s3" {
    bucket         = "terraform-artifacts"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}