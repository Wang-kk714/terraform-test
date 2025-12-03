# main.tf - call modules, locals, and data sources to create all resources
# Note: Provider configuration is inherited from the root module when used as a child module
# If you want to run this module independently, uncomment the provider block below

# provider "proxmox" {
#   pm_api_url          = "https://192.168.5.110:8006/api2/json"
#   pm_api_token_id     = var.pm_api_token_id
#   pm_api_token_secret = var.pm_api_token_secret
#   pm_tls_insecure     = true
# }
