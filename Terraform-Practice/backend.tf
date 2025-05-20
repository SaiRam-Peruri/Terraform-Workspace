terraform {
  backend "s3" {
    bucket         = "vubber-terraform-artifacts-v2"
    key            = "terraform.tfstate"
    region         = "us-west-1"
    # dynamodb_table = "terraform-locks"  # Optional: only if you set up state locking
  }
}
