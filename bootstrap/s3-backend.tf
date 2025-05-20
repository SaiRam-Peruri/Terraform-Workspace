provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-artifacts-v2"

  tags = {
    Name        = "TerraformBackendStateBucket"
    Environment = "bootstrap"
  }

  lifecycle {
    prevent_destroy = true
  }
}
