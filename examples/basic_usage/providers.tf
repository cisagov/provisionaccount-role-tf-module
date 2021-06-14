# This is the "default" provider that is used to create resources
# inside the example "Pettifogger0" account
provider "aws" {
  default_tags {
    tags = var.tags
  }
  # Use this profile once the account has been bootstrapped.
  profile = "example-pettifogger0-provisionaccount"
  # Use this profile, defined using programmatic credentials for
  # AWSAdministratorAccess as obtained for the example "Pettifogger0"
  # account from the AWS SSO page, to bootstrap the account.
  # profile = "example-pettifogger0-account-admin"
  region = var.aws_region
}
