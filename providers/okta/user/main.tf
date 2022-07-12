terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 3.20"
    }
  }
}

# - https://registry.terraform.io/providers/okta/okta/latest/docs/data-sources/user
data "okta_user" "user" {
  search {
    name = "profile.email"
    value = var.user.email
  }
}
