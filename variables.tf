variable "account" {
  type        = string
  description = "The account number to allow for a trust relationship"
  default     = ""
}

variable "principal_tag_key" {
  type        = string
  description = "The key of the tag to use to check for access permissions"
  default     = ""
}

variable "principal_tag_value" {
  type        = string
  description = "The value of the tag to use to check for access permissions"
  default     = ""
}

variable "policy_arn" {
  type        = string
  description = "The ARN of the AWS managed policy to attach to the created role"
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
}
