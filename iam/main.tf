terraform {
  required_version = "1.2.4"
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 3.20"
    }
  }
}

# uses environment variables - https://registry.terraform.io/providers/okta/okta/latest/docs#environment-variables
provider "okta" {}

locals {
  groups_map = {for k, v in module.groups : k => v.group}
  users_map  = {for k, v in module.group_users : k => v.user}
}

module "group_users" {
  source   = "../providers/okta/user"
  for_each = var.group_users
  user     = each.value
}

module "groups" {
  source   = "../providers/okta/group"
  for_each = var.app_groups
  group    = each.value
  users    = local.users_map
}

module "apps" {
  source   = "../providers/okta/oauth_app"
  for_each = var.apps
  type     = each.key
  apps     = each.value
  groups   = local.groups_map
}
