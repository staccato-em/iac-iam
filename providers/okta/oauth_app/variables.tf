variable "type" {
  type = string
}

variable "apps" {
  type = map(
    object({
      grant_types    = list(string)
      groups         = list(string)
      label          = string
      name           = string
      redirect_uris  = list(string)
      response_types = list(string)
    })
  )
}

variable "groups" {
  type = map(
    object({
      id                        = string
      custom_profile_attributes = any
      description               = any
      name                      = string
      skip_users                = bool
      users                     = list(any)
    })
  )
}
