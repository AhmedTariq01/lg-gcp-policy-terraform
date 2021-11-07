
locals {
  apply_org_policies     = true
  apply_folder_policies  = false
  apply_project_policies = true


  policy_files   = fileset("${path.module}/project-policies/", "*.y*ml")
  policy_decoded = [for file in local.policy_files : yamldecode(file("${path.module}/project-policies/${file}"))]
  policy_file    = { for policy in local.policy_decoded : policy.project.project_id => policy.project }
}

module "gcp_org_policies" {
  count  = local.apply_org_policies ? 1 : 0
  source = "./modules/gcp-org-policies"
}

module "gcp_folder_policies" {
  count  = local.apply_folder_policies ? 1 : 0
  source = "./modules/gcp-folder-policies"
}

module "gcp_project_policies" {
  for_each      = local.policy_file
  source        = "./modules/gcp-project-policies"
  bool_policies = each.value.policies
  list_policies = each.value.list_policies
  project_id    = each.value.project_id
}

#  output "test1" {
#      value = local.policies_data.variables
#  }
# output "test2" {
#     value = local.policies_data.VMvariables
# }

// output "local_policy_files" {
//   value = local.policy_files
// }
