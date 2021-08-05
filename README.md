# provisionaccount-role-tf-module #

[![GitHub Build Status](https://github.com/cisagov/provisionaccount-role-tf-module/workflows/build/badge.svg)](https://github.com/cisagov/provisionaccount-role-tf-module/actions)

This is a generic skeleton project that can be used to quickly get a
new [cisagov](https://github.com/cisagov) [Terraform
module](https://www.terraform.io/docs/modules/index.html) GitHub
repository started.  This skeleton project contains [licensing
information](LICENSE), as well as [pre-commit
hooks](https://pre-commit.com) and
[GitHub Actions](https://github.com/features/actions) configurations
appropriate for the major languages that we use.

See [here](https://www.terraform.io/docs/modules/index.html) for more
details on Terraform modules and the standard module structure.

## Usage ##

```hcl
module "provisionaccount" {
  source = "github.com/cisagov/provisionaccount-role-tf-module"

  provisionaccount_role_description          = "Allows sufficient permissions to provision all AWS resources in the DNS account."
  provisionaccount_role_name                 = "ProvisionAccount"
  users_account_id                           = "111111111111"
}
```

## Examples ##

- [Basic Usage](https://github.com/cisagov/provisionaccount-role-tf-module/tree/develop/examples/basic_usage)

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 3.38 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.38 |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_role.provisionaccount_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.iamfullaccess_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | The AWS region where the non-global resources for the new account are to be provisioned (e.g. "us-east-1"). | `string` | `"us-east-1"` | no |
| provisionaccount\_role\_description | The description to associate with the IAM role that allows sufficient permissions to provision all AWS resources in the new account (e.g. "Allows sufficient permissions to provision all AWS resources in the DNS account."). | `string` | n/a | yes |
| provisionaccount\_role\_name | The name to assign the IAM role that allows sufficient permissions to provision all AWS resources in the new account (e.g. "ProvisionAccount"). | `string` | n/a | yes |
| users\_account\_id | The ID of the users account.  This account will be allowed to assume the role that allows sufficient permissions to provision all AWS resources in the new account. | `string` | n/a | yes |

## Outputs ##

| Name | Description |
|------|-------------|
| provisionaccount\_role | The IAM role that allows sufficient permissions to provision all AWS resources in this account. |

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, these are the main directory and
every directory under `examples/`.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
