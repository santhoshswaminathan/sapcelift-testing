variable "standard_tags" {
  description = "Standard tags to apply"
  type = object({
    Environment = string,
  })
}

variable "custom_tags" {
  description = "Custom tags to apply"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "The name of the Transit Gateway"
  type        = string
}
variable "cidr_block" {
  description = "The CIDR block of the VPC"
  type        = string
}

variable "public_subnets" {
  description = "The list of public subnets for the ECS cluster"
  type = list(object({
    cidr_block        = string
    availability_zone = string
    name              = string
    subnet_group      = string
  }))
}

variable "private_subnets" {
  description = "The list of private subnets for the ECS cluster"
  type = list(object({
    cidr_block        = string
    availability_zone = string
    name              = string
    subnet_group      = string
  }))
}

variable "enable_s3_endpoint" {
  description = "Whether or not to enable the S3 endpoint"
  type        = bool
  default     = true
}

variable "enable_ecr_endpoint" {
  description = "Whether or not to enable the ECR endpoint"
  type        = bool
  default     = true
}

variable "enable_cloudwatch_endpoint" {
  description = "Whether or not to enable the CloudWatch endpoint"
  type        = bool
  default     = false
}

variable "enable_ecs_endpoint" {
  description = "Whether or not to enable the ECS endpoint"
  type        = bool
  default     = false
}
