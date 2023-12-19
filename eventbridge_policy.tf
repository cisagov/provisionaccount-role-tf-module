# ------------------------------------------------------------------------------
# Create the IAM policy that allows all of the EventBridge actions
# necessary to create an EventBridge rule that is triggered whenever a
# new IAM or SSO user is created, as well as connect a target to that
# rule.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "eventbridge" {
  statement {
    actions = [
      "events:DeleteRule",
      "events:DescribeRule",
      "events:ListTagsForResource",
      "events:ListTargetsByRule",
      "events:PutRule",
      "events:PutTargets",
      "events:RemoveTargets",
      "events:TagResource",
      "events:UntagResource",
    ]
    resources = ["*"]
  }

}

resource "aws_iam_policy" "eventbridge" {
  description = var.eventbridge_policy_description
  name        = var.eventbridge_policy_name
  policy      = data.aws_iam_policy_document.eventbridge.json
}
