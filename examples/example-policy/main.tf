provider "aws" {
  region  = "us-east-1"
  profile = "infralab"
}

module "kms" {
  source = "./../../"

  enabled = true

  description             = "KMS test description"
  alias_name              = "test-key-policy"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  policy                  = data.aws_iam_policy_document.default.json

  tags = {
    "environment"        = "lab"
    "organization-owner" = "infrastructure"
    "business-owner"     = "sre"
    "application"        = "key"
    "product"            = "kms"
  }
}

data "aws_iam_policy_document" "default" {
  # checkov:skip=BC_AWS_IAM_57: ADD REASON
  # checkov:skip=BC_AWS_IAM_56: ADD REASON
  # #tfsec:ignore:AWS097
  version = "2012-10-17"
  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::318259923343:root"]
    }
    actions   = ["kms:*"]
    resources = ["*"]
  }
  statement {
    sid    = "Allow access for Key Administrators"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::318259923343:root"]
    }
    actions = [
      "kms:Create*",
      "kms:Describe*",
      "kms:Enable*",
      "kms:List*",
      "kms:Put*",
      "kms:Update*",
      "kms:Revoke*",
      "kms:Disable*",
      "kms:Get*",
      "kms:Delete*",
      "kms:TagResource",
      "kms:UntagResource",
      "kms:ScheduleKeyDeletion",
      "kms:CancelKeyDeletion"
    ]
    resources = ["*"]
  }
  statement {
    sid    = "Allow use of the key"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::318259923343:root"]
    }
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = ["*"]
  }
}