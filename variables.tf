variable "env" {
  type = string
}
variable "location" {
  type    = string
  default = "Canada Central"
}
variable "bts_backend_asp_tier" {
  type = map(any)
  default = {
    "dev" = "Free and Shared"
    "qa"  = "Premium v2"
    "uat" = "Premium v2"

    #"uat" = "Premium v2"

  }
}

variable "bts_backend_asp_sku" {
  type = map(any)
  default = {
    "dev" = "F1"
    "qa"  = "P1v2"
    "uat" = "P2v2"

    #"uat" = "P2v2"
  }
}

# variable "vnet_address_space_map" {
#   type = map(any)
#   default = {
#     "dev"  = "10.1.0.0/16"
#     "qa"   = "10.1.0.0/16"
#     "uat"  = "10.1.0.0/16"
#     "prod" = "10.1.0.0/16"
#   }
# }
# variable "vnet_subnets_adb_private_map" {
#   type = map(any)
#   default = {
#     "dev"  = "10.0.5.0/24"
#     "qa"   = "10.0.5.0/24"
#     "uat"  = "10.0.5.0/24"
#     "prod" = "10.0.5.0/24"
#   }
# }
# variable "vnet_subnets_adb_public_map" {
#   type = map(any)
#   default = {
#     "dev"  = "10.0.6.0/24"
#     "qa"   = "10.0.6.0/24"
#     "uat"  = "10.0.6.0/24"
#     "prod" = "10.0.6.0/24"
#   }
# }
