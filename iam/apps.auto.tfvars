apps = {
  # this key is used to define the type of application is being created - https://registry.terraform.io/providers/okta/okta/latest/docs/resources/app_oauth
  web = {
    backstage = {
      # https://registry.terraform.io/providers/okta/okta/latest/docs/resources/app_oauth#grant_types
      grant_types = ["authorization_code", "refresh_token"]
      groups  = ["backstage_user"] # these values must correspond to a key in the `groups.auto.tfvars` file
      label       = "Backstage"
      name        = "Backstage"
      # https://registry.terraform.io/providers/okta/okta/latest/docs/resources/app_oauth#response_types
      response_types = ["code"]
      redirect_uris = [
        "http://localhost:7007/api/auth/okta/handler/frame",
        "http://localhost:7007"
      ]
    }
  }
}
