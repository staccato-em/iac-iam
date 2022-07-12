terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 3.20"
    }
  }
}

# uses environment variables - https://registry.terraform.io/providers/okta/okta/latest/docs#environment-variables
provider "okta" {}

module "group_users" {
  source   = "../providers/okta/user"
  for_each = var.group_users
  user     = each.value
}
