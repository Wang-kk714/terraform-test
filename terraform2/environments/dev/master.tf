# /terraform/k8s-infra/environments/prod/master.tf

# ------------------------------------
# k8s-master (控制平面)
# ------------------------------------
module "master" {
  source = "../../modules/proxmox-vm"

  vmid           = 301
  name           = "k8s-master"
  clone_template = var.base_template

  # 规格 (4 vCPU, 8G RAM, 80G Disk)
  cpu_cores      = 4
  ram_mb         = 8192
  boot_disk_size = "3584M"
  data_disk_size = "80G"

  # 存储和网络
  boot_storage   = "local-lvm"
  data_storage   = "local_ssd"
  ip_address     = "192.168.5.120"
  gateway        = "192.168.5.1"

  # 身份
  ci_user        = var.default_user
  ssh_public_key = file(var.ssh_key_path)
}