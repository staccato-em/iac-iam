terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 3.20"
    }
  }
}

# - https://registry.terraform.io/providers/okta/okta/latest/docs/resources/group
resource "okta_group" "group" {
  name = var.group.name
}

# - https://registry.terraform.io/providers/okta/okta/latest/docs/resources/group_memberships
resource "okta_group_memberships" "members" {
  group_id = okta_group.group.id
  users    = [for user in var.group.members : var.users[user].id]
}
