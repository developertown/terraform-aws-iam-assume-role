locals {
  enabled = var.enabled

  name = "${var.name}-${var.environment}%{if var.suffix != ""}-${var.suffix}%{endif}"

  tags = merge(
    var.tags,
    {
      "Environment" = var.environment,
      "ManagedBy"   = "Terraform"
    }
  )
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account}:root"]
    }

    actions = ["sts:AssumeRole"]

    condition {
      test     = "StringEquals"
      variable = "aws:PrincipalTag/${var.principal_tag_key}"

      values = [var.principal_tag_value]
    }
  }
}

resource "aws_iam_role" "role" {
  count = local.enabled ? 1 : 0

  name               = "${local.name}-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy" "policy" {
  arn = var.policy_arn
}

resource "aws_iam_role_policy_attachment" "managed-policy-attach" {
  count = local.enabled ? 1 : 0

  role       = one(aws_iam_role.role[*].name)
  policy_arn = data.aws_iam_policy.policy.arn
}