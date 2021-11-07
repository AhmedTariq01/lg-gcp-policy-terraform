
variable "org_id" {
  type = string
  // LG POC ORG
  default = "299580162370"
}

variable "vm_name" {
  type    = string
  default = "Infinity-hub-1"
}

variable "activate_apis" {
  description = "The list of apis to activate within the project"
  default = [
    "iam.googleapis.com",
    "cloudbilling.googleapis.com",
    "admin.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com"
  ]
}

variable "policy_resourceLocations" {
  description = "List of allowed regions for resources."
  default     = ["eu-locations"]
}
