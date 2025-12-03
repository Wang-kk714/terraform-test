# main.tf - call modules, locals, and data sources to create all resources

provider "proxmox" {
  pm_api_url          = "https://192.168.5.110:8006/api2/json"
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = true
}

# 引用 environments/dev 作为模块
module "dev" {
  source = "./environments/dev"

  # 传递必要的变量
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  base_template       = var.base_template
  ssh_key_path        = var.ssh_key_path
  default_user        = var.default_user
}
