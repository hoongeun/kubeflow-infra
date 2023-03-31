resource "aws_iam_role" "kubeflow_role" {
  for_each = var.usergroups
  name     = "${var.name}-${each.key}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.aws_account_id}:root"
        },
        Condition = {}
      },
    ]
  })
}

resource "aws_iam_group" "kubeflow_group" {
  for_each = var.usergroups
  name     = "${var.name}-kubeflow-${each.key}"
  path     = "/${var.name}/users/"
}

resource "aws_iam_group_policy" "kubeflow_role_policy" {
  for_each = var.usergroups
  name     = "${var.name}-kubeflow-${each.key}"
  group    = aws_iam_group.kubeflow_group[each.key].name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AllowAssumeOrganizationAccountRole",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:iam::${var.aws_account_id}:role/kubeflow-${each.key}"
      },
    ]
  })
}
