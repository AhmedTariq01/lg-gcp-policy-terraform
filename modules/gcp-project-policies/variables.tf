
variable "bool_policies" {
  description = "List of additional gcp security policies"
  type = list(object({
    name             = string,
    policyConstraint = string,
    enforce          = string,
    // records = list(string)
  }))
  default = null
}

variable "list_policies" {
  description = "list of list org policies, status is true for allow, false for deny, null for restore. Values can only be used for allow or deny."
  type = list(object({
    name                = string,
    policyConstraint    = string,
    inherit_from_parent = bool
    suggested_value     = string
    status              = bool
    values              = list(string)
  }))
  default = null
}

variable "project_id" {
  type    = string
  default = "362218542792"
}