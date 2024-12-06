terraform {
  source = "../../modules/s3"
}

inputs = {
  bucket_name   = "spacelift-dev-bucket"
  region        = "us-east-1"
  force_destroy = true
}
