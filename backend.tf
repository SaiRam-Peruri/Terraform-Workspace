terraform {
  backend "s3" {
    bucket  = "terraform-states-sairam-bucket"
    key     = "state/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}