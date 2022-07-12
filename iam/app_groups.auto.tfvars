app_groups = {
  backstage_user = {
    name = "Backstage User"
    # these values must correspond to a key in the `group_users.auto.tfvars` file
    members = ["em_jones"]
  }
  backstage_admin = {
    name    = "Backstage Admin"
    members = ["em_jones"]
  }
  team_software_delivery = {
    name    = "Team: Software Delivery"
    members = ["em_jones"]
  }
}