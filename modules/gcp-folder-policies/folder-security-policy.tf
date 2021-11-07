# folder_map = {
#   "Vm-prod"= ["Vm-prod-team-a", "Vm-prod-team-b"]
#   "lg-prod"= ["lg-prod-team-a", "lg-prod-team-b"]
#   #  "bld" = ["mgmt-bld", "eplus-bld", "dp-bld", "ap-bld", "vbp-bld", "sec-bld", "to-bld"]
#   #  "int" = ["mgmt-int", "eplus-int", "dp-int", "ap-int", "sec-int"]
#   #  "pre" = ["mgmt-pre", "eplus-pre", "dp-pre", "ap-pre", "sec-pre"]
#   #  "prd" = ["mgmt-prd", "eplus-prd", "dp-prd", "ap-prd", "sec-prd"]
#   #  "to"  = ["bld-to", "itst-to"]
# }

# folder_bool_policy = {
#    "Vm-prod" = {
#      "constraints/compute.disableNestedVirtualization"             = true
#      "constraints/compute.disableSerialPortAccess"                 = true
#      "constraints/compute.restrictXpnProjectLienRemoval"           = true
#      "constraints/compute.skipDefaultNetworkCreation"              = true
#      "constraints/iam.automaticIamGrantsForDefaultServiceAccounts" = true
#      "constraints/sql.restrictAuthorizedNetworks"                  = true
#      "constraints/sql.restrictPublicIp"                            = true
#   }
#    "lg-prod" = {
#      "constraints/compute.restrictXpnProjectLienRemoval"           = true
#      "constraints/compute.skipDefaultNetworkCreation"              = true
#      "constraints/iam.automaticIamGrantsForDefaultServiceAccounts" = true
#      "constraints/sql.restrictPublicIp"                            = true
#   }
#   #  "mgmt-bld" = {
#   #    "constraints/sql.restrictAuthorizedNetworks"      = true
#   #    "constraints/compute.disableNestedVirtualization" = true
#   #    "constraints/compute.disableSerialPortAccess"     = true
#   #  }
#   #  "int" = {
#   #    "constraints/compute.disableNestedVirtualization"             = true
#   #    "constraints/compute.disableSerialPortAccess"                 = true
#   #    "constraints/compute.restrictXpnProjectLienRemoval"           = true
#   #    "constraints/compute.skipDefaultNetworkCreation"              = true
#   #    "constraints/iam.automaticIamGrantsForDefaultServiceAccounts" = true
#   #    "constraints/sql.restrictAuthorizedNetworks"                  = true
#   #    "constraints/sql.restrictPublicIp"                            = true
#   #  }
#   #  "pre" = {
#   #    "constraints/compute.disableNestedVirtualization"             = true
#   #    "constraints/compute.disableSerialPortAccess"                 = true
#   #    "constraints/compute.restrictXpnProjectLienRemoval"           = true
#   #    "constraints/compute.skipDefaultNetworkCreation"              = true
#   #    "constraints/iam.automaticIamGrantsForDefaultServiceAccounts" = true
#   #    "constraints/sql.restrictAuthorizedNetworks"                  = true
#   #    "constraints/sql.restrictPublicIp"                            = true
#   #  }
#   #  "prd" = {
#   #    "constraints/compute.disableNestedVirtualization"             = true
#   #    "constraints/compute.disableSerialPortAccess"                 = true
#   #    "constraints/compute.restrictXpnProjectLienRemoval"           = true
#   #    "constraints/compute.skipDefaultNetworkCreation"              = true
#   #    "constraints/iam.automaticIamGrantsForDefaultServiceAccounts" = true
#   #    "constraints/sql.restrictAuthorizedNetworks"                  = true
#   #    "constraints/sql.restrictPublicIp"                            = true
#   #  }
#   #  "to" = {
#   #    "constraints/compute.restrictXpnProjectLienRemoval"           = true
#   #    "constraints/compute.skipDefaultNetworkCreation"              = true
#   #    "constraints/iam.automaticIamGrantsForDefaultServiceAccounts" = true
#   #    "constraints/sql.restrictPublicIp"                            = true
#   #  }
#   #  "bld-to" = {
#   #    "constraints/sql.restrictAuthorizedNetworks"      = true
#   #    "constraints/compute.disableNestedVirtualization" = true
#   #    "constraints/compute.disableSerialPortAccess"     = true
#   #  }
#   #  "itst-to" = {
#   #    "constraints/sql.restrictAuthorizedNetworks"      = true
#   #    "constraints/compute.disableNestedVirtualization" = true
#   #    "constraints/compute.disableSerialPortAccess"     = true
#   #  }

# }

# # folder_list_policy = {
# #    "tst" = {
# #      "constraints/compute.vmExternalIpAccess" = {
# #        "deny" = {
# #          "all" = true
# #        }
# #      }
# #      "constraints/gcp.resourceLocations" = {
# #        "allow" = {
# #          "values" = ["in:europe-locations", "eur5", "global"]
# #        }
# #      }
# #      "constraints/compute.restrictLoadBalancerCreationForTypes" = {
# #        "deny" = {
# #          "values" = ["in:EXTERNAL"]
# #        }
# #      }
# #    }
# #    "bld" = {
# #      "constraints/compute.vmExternalIpAccess" = {
# #        "deny" = {
# #          "all" = true
# #        }
# #      }
# #      "constraints/gcp.resourceLocations" = {
# #        "allow" = {
# #          "values" = ["in:europe-locations", "eur5", "global"]
# #        }
# #      }
# #      "constraints/compute.restrictLoadBalancerCreationForTypes" = {
# #        "deny" = {
# #          "values" = ["in:EXTERNAL"]
# #        }
# #      }
# #    }
# #    "int" = {
# #      "constraints/compute.vmExternalIpAccess" = {
# #        "deny" = {
# #          "all" = true
# #        }
# #      }
# #      "constraints/gcp.resourceLocations" = {
# #        "allow" = {
# #          "values" = ["in:europe-locations", "eur5", "global"]
# #        }
# #      }
# #      "constraints/compute.restrictLoadBalancerCreationForTypes" = {
# #        "deny" = {
# #          "values" = ["in:EXTERNAL"]
# #        }
# #      }
# #    }
# #    "pre" = {
# #      "constraints/compute.vmExternalIpAccess" = {
# #        "deny" = {
# #          "all" = true
# #        }
# #      }
# #      "constraints/gcp.resourceLocations" = {
# #        "allow" = {
# #          "values" = ["in:europe-locations", "eur5", "global"]
# #        }
# #      }
# #      "constraints/compute.restrictLoadBalancerCreationForTypes" = {
# #        "deny" = {
# #          "values" = ["in:EXTERNAL"]
# #        }
# #      }
# #    }
# #    "prd" = {
# #      "constraints/compute.vmExternalIpAccess" = {
# #        "deny" = {
# #          "all" = true
# #        }
# #      }
# #      "constraints/gcp.resourceLocations" = {
# #        "allow" = {
# #          "values" = ["in:europe-locations", "eur5", "global"]
# #        }
# #      }
# #      "constraints/compute.restrictLoadBalancerCreationForTypes" = {
# #        "deny" = {
# #          "values" = ["in:EXTERNAL"]
# #        }
# #      }
# #    }
# #    "to" = {
# #      "constraints/compute.vmExternalIpAccess" = {
# #        "deny" = {
# #          "all" = true
# #        }
# #      }
# #      "constraints/gcp.resourceLocations" = {
# #        "allow" = {
# #          "values" = ["in:europe-locations", "eur5", "global"]
# #        }
# #      }
# #      "constraints/compute.restrictLoadBalancerCreationForTypes" = {
# #        "deny" = {
# #          "values" = ["in:EXTERNAL"]
# #        }
# #      }
# #    }
# #  }