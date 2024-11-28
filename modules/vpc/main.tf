module "vpc" {
  source                     = "git@github.com:cardioone/tf-modules.git//aws/vpc"
  cidr_block                 = var.cidr_block
  name                       = var.name
  standard_tags              = var.standard_tags
  enable_s3_endpoint         = var.enable_s3_endpoint
  enable_ecr_endpoint        = var.enable_ecr_endpoint
  enable_cloudwatch_endpoint = var.enable_cloudwatch_endpoint
  enable_ecs_endpoint        = var.enable_ecs_endpoint
  public_subnets             = var.public_subnets
  private_subnets            = var.private_subnets
}

