# environments/dev/woker1.tf

# ------------------------------------
# k8s-worker-main
# ------------------------------------
module "woker1" {
  source = "../../modules/proxmox-vm"

  vmid           = 302
  name           = "k8s-worker-main-01"
  clone_template = var.base_template

  # 规格 (8 vCPU, 16G RAM, 200G Disk)
  cpu_cores      = 8
  ram_mb         = 16384 # 16 GB
  boot_disk_size = "3584M"
  data_disk_size = "200G" # 总计 200G

  # 存储和网络
  boot_storage   = "local-lvm"
  data_storage   = "local_ssd"
  ip_address     = "192.168.5.121"
  gateway        = "192.168.5.1"

  # 身份
  ci_user        = var.default_user
  ssh_public_key = file(var.ssh_key_path)
}