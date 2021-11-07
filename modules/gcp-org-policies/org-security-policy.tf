
######## IAM SECURITY POLICIES ########

resource "google_organization_policy" "no_service_accounts" {
  org_id     = var.org_id
  constraint = "iam.disableServiceAccountCreation"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "no_service_account_keys" {
  org_id     = var.org_id
  constraint = "iam.disableServiceAccountKeyCreation"
  boolean_policy {
    enforced = true
  }
}
# for_each = {
#   a_group = "centralus"
# }
# name     = each.key

######## VIRTUAL MACHINE SECURITY POLICIES ########

resource "google_organization_policy" "serial_port_policy" {

  org_id     = var.org_id
  constraint = "compute.disableSerialPortAccess"

  boolean_policy {
    enforced = false
  }
}

# ###locals

# locals {
#   permissionsbyrole = flatten([
#     for roleName, permlist in var.role_map_aws_policies : [
#       for policy in permlist : {
#         role_name = roleName
#         policy    = policy
#       }
#     ]
#   ])
# }
resource "google_organization_policy" "no_external_ips" {

  org_id     = var.org_id
  constraint = "constraints/compute.vmExternalIpAccess"
  list_policy {
    deny {
      all = true
    }
  }
}

resource "google_organization_policy" "restrict_storage_access" {

  org_id     = var.org_id
  constraint = "constraints/compute.storageResourceUseRestrictions"
  list_policy {
    deny {
      all = true
    }
  }
}

resource "google_organization_policy" "require_shielded_vm" {

  org_id     = var.org_id
  constraint = "constraints/compute.requireShieldedVm"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "disable_guest_attributes" {

  org_id     = var.org_id
  constraint = "constraints/compute.disableGuestAttributesAccess"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "no_serial_port_access" {

  org_id     = var.org_id
  constraint = "constraints/compute.disableSerialPortAccess"
  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "no_serial_port_logging" {

  org_id     = var.org_id
  constraint = "constraints/compute.disableSerialPortLogging"
  boolean_policy {
    enforced = true
  }
}


resource "google_organization_policy" "no_nested_virt" {

  org_id     = var.org_id
  constraint = "constraints/compute.disableNestedVirtualization"
  boolean_policy {
    enforced = true
  }
}

######## STORAGE BUCKETS SECURITY POLICIES ########

resource "google_organization_policy" "bucket_policy_no_acls" {

  org_id     = var.org_id
  constraint = "storage.uniformBucketLevelAccess"

  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "no_default_networks" {

  org_id     = var.org_id
  constraint = "compute.skipDefaultNetworkCreation"

  boolean_policy {
    enforced = true
  }
}
