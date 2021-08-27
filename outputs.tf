output "key_arn" {
  value       = join("", aws_kms_key.default.*.arn)
  description = "KMS Key ARN."
}

output "key_id" {
  value       = join("", aws_kms_key.default.*.key_id)
  description = "KMS Key ID."
}

output "alias_arn" {
  value       = join("", aws_kms_alias.default.*.arn)
  description = "KMS Alias ARN."
}

output "alias_name" {
  value       = join("", aws_kms_alias.default.*.name)
  description = "KMS Alias name."
}