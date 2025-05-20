provider "aws" {
  region = "us-west-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-artifacts"

  tags = {
    Name        = "TerraformBackendStateBucket"
    Environment = "bootstrap"
  }

  lifecycle {
    prevent_destroy = true
  }
}
