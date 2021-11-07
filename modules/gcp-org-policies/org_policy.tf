
// output "org_policy_settings" {
//   value = "${yamldecode(file("OrgPolicy.yml"))}"
// }

// output "policy_settings" {
//   value = "${yamldecode(file("org_policies.yaml"))["policies"][0]["orgId"]}"
// }

// output "policy_yaml" {
//   value = "${yamldecode(file("org_policies.yaml"))["policies"]}"
// }

# module "ymal_config" {
#   source = "../../"
#   name= "Infinity_hub"
#   type= "compute.v1.instance"
#   property = { 
#     zone = "us-central1-a"
#     machineType = "zones/us-central1-a/machineTypes/n1-standard-1"
#     disk = {
#       deviceName = "boot"
#       type = "PERSISTENT"
#       boot = true
#       autoDelete = true
#       initializeParam = {
#         sourceImage = "projects/debian-cloud/global/images/family/debian-9"
#       }
#     }
#     networkInterfaces = {
#       network = "global/networks/default"
#   }
#   }
# }
