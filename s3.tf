resource "aws_s3_bucket" "terraform_artifacts_v2" {
  bucket = "vubber-terraform-artifacts-v2"  

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "TerraformArtifacts"
    Environment = "Dev"
  }
}
