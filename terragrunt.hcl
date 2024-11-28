locals {
  env_vars     = yamldecode(file("${find_in_parent_folders("env.hcl")}"))
  region   = local.env_vars["region"]
  environment  = local.env_vars["environment"]
}

generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.region}"
}
provider "aws" {
  alias  = "edge"
  region = "us-east-1"
}
EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "space-lift-terraform-state" 
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1" 
    encrypt        = true
    assume_role = {
      role_arn = "arn:aws:iam::710198852569:role/terraform"
    }
  }
}
