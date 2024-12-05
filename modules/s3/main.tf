provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

resource "aws_s3_bucket" "example" {
  bucket        = var.bucket_name
  acl           = "private"
  force_destroy = var.force_destroy

  tags = {
    Environment = var.environment
    ManagedBy   = "Spacelift"
  }
}
