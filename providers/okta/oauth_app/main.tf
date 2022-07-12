terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 3.20"
    }
  }
}

# - https://registry.terraform.io/providers/okta/okta/latest/docs/resources/app_oauth
resource "okta_app_oauth" "app" {
  for_each       = var.apps
  type           = var.type
  label          = each.value.label
  grant_types    = each.value.grant_types
  redirect_uris  = each.value.redirect_uris
  response_types = each.value.response_types
  lifecycle {
    ignore_changes = [groups]
  }
}

# - https://registry.terraform.io/providers/okta/okta/latest/docs/resources/app_group_assignments
resource "okta_app_group_assignments" "app_group" {
  for_each = var.apps
  app_id   = okta_app_oauth.app[each.key].id
  dynamic "group" {
    for_each = each.value.groups
    content {
      id = var.groups[group.value].id
    }
  }
}

