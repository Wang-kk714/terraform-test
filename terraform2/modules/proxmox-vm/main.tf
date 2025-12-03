# modules/proxmox-vm/main.tf - call modules, locals, and data sources to create all resources

resource "proxmox_vm_qemu" "ubuntu" {
  vmid        = var.vmid
  name        = var.name
  clone       = var.clone_template
  target_node = var.target_node

  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  cpu {
    cores = var.cpu_cores
  }
  memory = var.ram_mb

  network {
    id     = 0
    model  = "virtio"
    bridge = var.network_bridge
  }

  # --- Disk 1: Boot Disk (General LVM) ---
  disk {
    type    = "disk"
    storage = var.boot_storage
    size    = var.boot_disk_size
    slot    = "scsi0"
  }

  # --- Disk 2: Data Disk (High-Performance SSD) ---
  disk {
    type    = "disk"
    storage = var.data_storage
    size    = var.data_disk_size
    slot    = "scsi1"
  }

  # --- Disk 3: Cloud-Init Driver ---
  disk {
    slot    = "ide2"
    type    = "cloudinit"
    storage = var.boot_storage
  }

  # Cloud-init
  ciuser  = var.ci_user
  sshkeys = var.ssh_public_key
  ipconfig0 = "ip=${var.ip_address}/24,gw=${var.gateway}"
}