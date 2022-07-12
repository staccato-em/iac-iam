variable "group" {
  type = object({
    name    = string
    members = list(string)
  })
}

variable "users" {
  type = map(
    object({
      id = string
    })
  )
}
