
######## IAM SECURITY POLICIES ########

resource "google_project_organization_policy" "project_security_policy" {
  for_each = { for r in var.bool_policies :
    join(":", [r.policyConstraint, r.name]) => r
  }

  project    = var.project_id
  constraint = each.value.policyConstraint

  dynamic "boolean_policy" {
    for_each = each.value.enforce == null ? [] : [each.value]
    iterator = policy
    content {
      enforced = policy.value.enforce
    }
  }

  dynamic "restore_policy" {
    for_each = each.value.enforce == null ? [""] : []
    content {
      default = true
    }
  }
}

resource "google_project_organization_policy" "project_list_security_policy" {
  for_each = { for r in var.list_policies :
    join(":", [r.policyConstraint, r.name]) => r
  }

  project    = var.project_id
  constraint = each.value.policyConstraint

  dynamic "list_policy" {
    for_each = each.value.status == null ? [] : [each.value]
    iterator = policy
    content {
      inherit_from_parent = policy.value.inherit_from_parent
      suggested_value     = policy.value.suggested_value
      dynamic "allow" {
        for_each = policy.value.status ? [""] : []
        content {
          values = (
            try(length(policy.value.values) > 0, false)
            ? policy.value.values
            : null
          )
          all = (
            try(length(policy.value.values) > 0, false)
            ? null
            : true
          )
        }
      }
      dynamic "deny" {
        for_each = policy.value.status ? [] : [""]
        content {
          values = (
            try(length(policy.value.values) > 0, false)
            ? policy.value.values
            : null
          )
          all = (
            try(length(policy.value.values) > 0, false)
            ? null
            : true
          )
        }
      }
    }
  }

  dynamic "restore_policy" {
    for_each = each.value.status == null ? [true] : []
    content {
      default = true
    }
  }
}
