# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "provisionaccount_role_description" {
  type        = string
  description = "The description to associate with the IAM role that allows sufficient permissions to provision all AWS resources in the new account (e.g. \"Allows sufficient permissions to provision all AWS resources in the DNS account.\")."
}

variable "provisionaccount_role_name" {
  type        = string
  description = "The name to assign the IAM role that allows sufficient permissions to provision all AWS resources in the new account (e.g. \"ProvisionAccount\")."
}

variable "users_account_id" {
  type        = string
  description = "The ID of the users account.  This account will be allowed to assume the role that allows sufficient permissions to provision all AWS resources in the new account."
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------
variable "eventbridge_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that allows sufficient permissions to create an EventBridge rule that is triggered whenever a new IAM or SSO user is created, as well as connect a target to that rule, in the new account."
  default     = "Allows sufficient permissions to create an EventBridge rule that is triggered whenever a new IAM or SSO user is created, as well as connect a target to that rule, in the new account."
}

variable "eventbridge_policy_name" {
  type        = string
  description = "The name to assign the IAM policy that allows sufficient permissions to create an EventBridge rule that is triggered whenever a new IAM or SSO user is created, as well as connect a target to that rule, in the new account."
  default     = "NewUserEventBridgePolicy"
}

variable "sns_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that allows sufficient permissions to create and subscribe to a generic notification topic for CloudWatch alarms in the new account."
  default     = "Allows sufficient permissions to create and subscribe to a generic notification topic for CloudWatch alarms in the new account."
}

variable "sns_policy_name" {
  type        = string
  description = "The name to assign the IAM policy that allows sufficient permissions to create and subscribe to a generic notification topic for CloudWatch alarms in the new account."
  default     = "CWAlarmSNSTopicPolicy"
}

variable "aws_region" {
  type        = string
  description = "The AWS region where the non-global resources for the new account are to be provisioned (e.g. \"us-east-1\")."
  default     = "us-east-1"
}
