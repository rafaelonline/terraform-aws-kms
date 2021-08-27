output "key_arn" {
  value       = module.kms.key_arn
  description = "KMS Key ARN."
}

output "key_id" {
  value       = module.kms.key_id
  description = "KMS Key ID."
}

output "alias_arn" {
  value       = module.kms.alias_arn
  description = "KMS Alias ARN."
}

output "alias_name" {
  value       = module.kms.alias_name
  description = "KMS Alias name."
}