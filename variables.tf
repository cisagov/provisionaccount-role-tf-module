# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "provisionaccount_role_description" {
  description = "The description to associate with the IAM role that allows sufficient permissions to provision all AWS resources in the new account (e.g. \"Allows sufficient permissions to provision all AWS resources in the DNS account.\")."
  nullable    = false
  type        = string
}

variable "provisionaccount_role_name" {
  description = "The name to assign the IAM role that allows sufficient permissions to provision all AWS resources in the new account (e.g. \"ProvisionAccount\")."
  nullable    = false
  type        = string
}

variable "users_account_id" {
  description = "The ID of the users account.  This account will be allowed to assume the role that allows sufficient permissions to provision all AWS resources in the new account."
  nullable    = false
  type        = string
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------
variable "eventbridge_policy_description" {
  default     = "Allows sufficient permissions to create an EventBridge rule that is triggered whenever a new IAM or SSO user is created, as well as connect a target to that rule, in the new account.  Also alows sufficient permissions to create an EventBridge rule that is run at a fixed cadence with a Lambda target that disables AWS access for inactive users."
  description = "The description to associate with the IAM policy that allows sufficient permissions to create an EventBridge rule that is triggered whenever a new IAM or SSO user is created, as well as connect a target to that rule, in the new account.  This policy is also used to create an EventBridge rule that is run at a fixed cadence with a Lambda target that disables AWS access for inactive users."
  nullable    = false
  type        = string
}

variable "eventbridge_policy_name" {
  default     = "NewUserEventBridgePolicy"
  description = "The name to assign the IAM policy that allows sufficient permissions to create an EventBridge rule that is triggered whenever a new IAM or SSO user is created, as well as connect a target to that rule, in the new account.  This policy is also used to create an EventBridge rule that is run at a fixed cadence with a Lambda target that disables AWS access for inactive users."
  nullable    = false
  type        = string
}

variable "lambda_policy_description" {
  default     = "Allows sufficient permissions to create a Lambda function in the new account."
  description = "The description to associate with the IAM policy that allows sufficient permissions to create a Lambda function in the new account."
  nullable    = false
  type        = string
}

variable "lambda_policy_name" {
  default     = "LambdaPolicy"
  description = "The name to assign the IAM policy that allows sufficient permissions to create a Lambda function in the new account."
  nullable    = false
  type        = string
}

variable "sns_policy_description" {
  default     = "Allows sufficient permissions to create and subscribe to a generic notification topic for CloudWatch alarms in the new account."
  description = "The description to associate with the IAM policy that allows sufficient permissions to create and subscribe to a generic notification topic for CloudWatch alarms in the new account."
  nullable    = false
  type        = string
}

variable "sns_policy_name" {
  default     = "CWAlarmSNSTopicPolicy"
  description = "The name to assign the IAM policy that allows sufficient permissions to create and subscribe to a generic notification topic for CloudWatch alarms in the new account."
  nullable    = false
  type        = string
}

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region where the non-global resources for the new account are to be provisioned (e.g. \"us-east-1\")."
  nullable    = false
  type        = string
}
