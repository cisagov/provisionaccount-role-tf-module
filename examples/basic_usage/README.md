# Basic usage of provisionaccount-role-tf-module #

This example directory contains Terraform code to provision an example AWS
account called "Pettifogger0".  It creates an IAM role that allows sufficient
permissions to provision all AWS resources in this account.  This role
has a trust relationship with the users account.

In order to use this example code, you will need to either create your own
Pettifogger0 account or replace references to it with an account that you
already have created.

## Bootstrapping this account ##

Note that this account must be bootstrapped.  This is because there is
no IAM role that can be assumed to build out these resources.
Therefore you must first apply this Terraform code with programmatic
credentials for AWSAdministratorAccess as obtained for the example
Pettifogger0 account from the AWS SSO page.

To do this, follow these steps (the steps below use an example environment named
"dev"; replace "dev" with the name of your environment):

1. Comment out the `profile = "example-pettifogger0-provisionaccount"` line for
   the "default" provider in `providers.tf` and directly below that uncomment
   the line `profile = "example-pettifogger0-account-admin"`.
1. Create a new AWS profile called `example-pettifogger0-account-admin` in your
   Boto3 configuration using the "AWSAdministratorAccess" credentials (access
   key ID, secret access key, and session token) as obtained from the example
   Pettifogger0 account:

   ```console
   [example-pettifogger0-account-admin]
   aws_access_key_id = <MY_ACCESS_KEY_ID>
   aws_secret_access_key = <MY_SECRET_ACCESS_KEY>
   aws_session_token = <MY_SESSION_TOKEN>
   ```

1. Create a backend configuration file named `dev.tfconfig` containing the name
   of the S3 bucket where "dev" environment Terraform state is stored - this
   file is required to initialize the Terraform backend in each environment:

    ```hcl
    bucket = "my-dev-terraform-state-bucket"
    ```

1. Initialize the Terraform backend for the "dev" environment using your backend
   configuration file:

    ```console
    terraform init -upgrade -backend-config=dev.tfconfig
    ```

    > [!NOTE]
    > When performing this step for additional environments (i.e. not your first
    > environment), use the `-reconfigure` flag:
    >
    > ```console
    > terraform init -upgrade -backend-config=other-env.tfconfig -reconfigure
    > ```

1. Create a Terraform variables file named `dev.tfvars` containing all of the
   required variables (see [Inputs](#inputs) below for details). For example:

    ```hcl
    users_account_id = "222222222222"
    ```

1. Run `terraform apply -var-file=dev.tfvars`.
1. Revert the changes you made to `providers.tf` in step 1.
1. Re-run `terraform apply -var-file=dev.tfvars`.

At this point the account has been bootstrapped, and you can apply future
changes by simply re-running `terraform apply -var-file=dev.tfvars`.

<!-- BEGIN_TF_DOCS -->
## Requirements ##

| Name | Version |
| ---- | ------- |
| terraform | ~> 1.1 |
| aws | ~> 6.7 |

## Providers ##

No providers.

## Modules ##

| Name | Source | Version |
| ---- | ------ | ------- |
| provisionaccount | ../.. | n/a |

## Resources ##

No resources.

## Inputs ##

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| aws\_region | The AWS region where the non-global resources for the example Pettifogger0 account are to be provisioned (e.g. "us-east-1"). | `string` | `"us-east-1"` | no |
| provisionaccount\_role\_description | The description to associate with the IAM role that allows sufficient permissions to provision all AWS resources in the example Pettifogger0 account. | `string` | `"Allows sufficient permissions to provision all AWS resources in the example Pettifogger0 account."` | no |
| provisionaccount\_role\_name | The name to assign the IAM role that allows sufficient permissions to provision all AWS resources in the example Pettifogger0 account. | `string` | `"ProvisionAccount"` | no |
| tags | Tags to apply to all AWS resources created. | `map(string)` | `{}` | no |
| users\_account\_id | The ID of the users account.  This account will be allowed to assume the role that allows sufficient permissions to provision all AWS resources in the example Pettifogger0 account. | `string` | n/a | yes |

## Outputs ##

| Name | Description |
| ---- | ----------- |
| provisionaccount\_role\_arn | The ARN of the IAM role that allows sufficient permissions to provision all AWS resources in the example Pettifogger0 account. |
<!-- END_TF_DOCS -->
