# ------------------------------------------------------------------------------
# Create the IAM policy that allows all of the Lambda actions
# necessary to create a Lambda that is run at a fixed cadence to
# disable AWS access for inactive users.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "lambda" {
  statement {
    actions = [
      "lambda:AddPermission",
      "lambda:CreateFunction",
      "lambda:DeleteFunction",
      "lambda:EnableReplication",
      "lambda:GetFunction",
      "lambda:GetFunctionCodeSigningConfig",
      "lambda:GetPolicy",
      "lambda:ListVersionsByFunction",
      "lambda:RemovePermission",
      "lambda:TagResource",
      "lambda:UntagResource",
      "lambda:UpdateFunctionCode",
      "lambda:UpdateFunctionConfiguration",
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:DeleteLogGroup",
      "logs:DescribeLogGroups",
      "logs:ListTagsForResource",
      "logs:ListTagsLogGroup",
      "logs:PutRetentionPolicy",
      "logs:TagLogGroup",
      "logs:TagResource",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "lambda" {
  description = var.lambda_policy_description
  name        = var.lambda_policy_name
  policy      = data.aws_iam_policy_document.lambda.json
}
