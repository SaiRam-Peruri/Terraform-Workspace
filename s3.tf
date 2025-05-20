resource "aws_s3_bucket" "terraform_artifacts_v2" {
  bucket = "terraform-artifacts-v2"  

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "TerraformArtifacts"
    Environment = "Dev"
  }
}

terraform {
  backend "s3" {
    bucket         = "terraform-artifacts-v2"
    key            = "state/terraform.tfstate"
    region         = "us-west-1"
    encrypt        = true
  }
}
