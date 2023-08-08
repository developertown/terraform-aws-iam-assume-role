<!-- BEGIN_TF_DOCS -->
# terraform-aws-iam-assume-role

This module manage the AWS IAM to create role and policy to assume role.

## Usage

### Basic

```hcl
include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../..//."
}

inputs = {
  enabled = true

  region      = "us-east-2"
  environment = "test"

  account = "123456789012"

  tags = {
    "Company" = "DeveloperTown"
  }
}
```
<!-- END_TF_DOCS -->