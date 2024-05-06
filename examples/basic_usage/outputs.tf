output "provisionaccount_role_arn" {
  description = "The ARN of the IAM role that allows sufficient permissions to provision all AWS resources in the example Pettifogger0 account."
  value       = module.provisionaccount.provisionaccount_role.arn
}
