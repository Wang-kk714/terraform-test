# /terraform/k8s-infra/environments/prod/master.tf

# ------------------------------------
# k8s-master (控制平面)
# ------------------------------------
module "master" {
  source = "../../modules/proxmox-vm"

  vmid           = 301
  name           = "master"
  clone_template = var.base_template

  # 规格 (4 vCPU, 8G RAM, 80G Disk)
  cpu_cores      = 4
  ram_mb         = 8192
  boot_disk_size = "80G"
  #data_disk_size = "80G"

  # 存储和网络
  boot_storage   = local.default_boot_storage
  #data_storage   = local.performance_storage
  ip_address     = "192.168.5.120"
  gateway        = local.default_gateway

  # 身份
  ci_user        = var.default_user
  ssh_public_key = file(var.ssh_key_path)
}