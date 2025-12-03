# environments/dev/worker2.tf

# ------------------------------------
# k8s-worker-light (Dev Worker)
# ------------------------------------
module "woker2" {
  source = "../../modules/proxmox-vm"

  vmid           = 303
  name           = "k8s-worker-light"
  target_node    = "laptop1"
  clone_template = "Copy-ubuntu-noble"

  # 规格 (4 vCPU, 8G RAM, 120G Disk - 对应笔记本)
  cpu_cores      = 4
  ram_mb         = 8192 # 8 GB
  boot_disk_size = "3584M"
  data_disk_size = "12G" # 总计 120G

  # 存储和网络
  boot_storage   = "local-lvm"
  data_storage   = "local-lvm"
  ip_address     = "192.168.5.122"
  gateway        = "192.168.5.1"

  # 身份
  ci_user        = var.default_user
  ssh_public_key = file(var.ssh_key_path)
}