# environments/dev/woker1.tf

module "woker1" {
  source = "../../modules/proxmox-vm"

  vmid           = 302
  name           = "worker-main1"
  clone_template = var.base_template

  # 规格 (8 vCPU, 16G RAM, 200G Disk)
  cpu_cores      = 8
  ram_mb         = 16384 # 16 GB
  boot_disk_size = "200G"
  #data_disk_size = "200G" # 总计 200G

  # 存储和网络
  boot_storage   = local.default_boot_storage
  #data_storage   = local.performance_storage
  ip_address     = "192.168.5.121"
  gateway        = local.default_gateway

  # 身份
  ci_user        = var.default_user
  ssh_public_key = file(var.ssh_key_path)
}