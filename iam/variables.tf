variable "group_users" {
  type = map( # the map key defined here is used as a value in the `members` list in the `groups.auto.tfvars`
    object({
      email = string
    })
  )
  description = "A user that _can_ be assigned to groups"
}

/*
* The `apps` type is specified in the `apps.auto.tfvars` file.
* The interface
*/
variable "apps" {
  type = map(
    map(
      object({
        grant_types    = list(string)
        groups         = list(string) # must be a key on the `groups` map in `groups.auto.tfvars`
        label          = string
        name           = string
        redirect_uris  = list(string)
        response_types = list(string)
      })
    )
  )
  validation {
    condition = alltrue([
      for type in keys(var.apps) : contains([
        "browser", #SPA
        "native",
        "service",
        "web"
      ], type)
    ])
    error_message = "The app keys must match one of browser|native|service|web."
  }
}

variable "app_groups" {
  type = map(
    object({
      name    = string
      members = list(string) # need to be keys from the `users.auto.tfvars` variables
    })
  )
}
