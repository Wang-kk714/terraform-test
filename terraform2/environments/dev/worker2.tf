# environments/dev/worker2.tf

# ------------------------------------
# k8s-worker-light (Dev Worker)
# ------------------------------------
module "woker2" {
  source = "../../modules/proxmox-vm"

  vmid           = 303
  name           = "worker-light"
  target_node    = "laptop1"
  clone_template = "Copy-ubuntu-noble"

  # 规格 (4 vCPU, 8G RAM, 120G Disk - 对应笔记本)
  cpu_cores      = 4
  ram_mb         = 8192 # 8 GB
  boot_disk_size = "120G"
  #data_disk_size = "120G" # 总计 120G

  # 存储和网络
  boot_storage   = local.default_boot_storage
  #data_storage   = local.default_data_storage
  ip_address     = "192.168.5.122"
  gateway        = local.default_gateway

  # 身份
  ci_user        = var.default_user
  ssh_public_key = file(var.ssh_key_path)
}