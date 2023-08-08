output "iam_role_arn" {
  description = "The ARN of IAM role"
  value       = one(aws_iam_role.role[*].arn)
}
