provider "aws" {
  region = "us-east-1"
}

module "kms" {
  source = "./../../"

  enabled = true

  description             = "KMS test description"
  alias_name              = "test-key-module"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    "environment"        = "lab"
    "organization-owner" = "infrastructure"
    "business-owner"     = "sre"
    "application"        = "key"
    "product"            = "kms"
  }
}