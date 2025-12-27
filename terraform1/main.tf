resource "proxmox_vm_qemu" "ubuntu" {
  vmid        = 300
  name        = "ansible"
  clone       = "Copy-ubuntu-noble"
  target_node = "laptop1"

  scsihw      = "virtio-scsi-pci"
  
  # *** 新增: 指定引导设备 ID ***
  # 'scsi0' 是您希望引导的设备
  bootdisk = "scsi0" 

  # CPU / Mem
  cpu {
    cores = 4
  }
  memory  = 4096

  # Network
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  # --- Disk 1: Boot Disk ---
  disk {
    type    = "disk" 
    storage = "local-lvm"
    size    = "100G"
    slot    = "scsi0" 
  }
  
  # --- Disk 3: Cloud-Init 驱动器 ---
  disk {
    slot    = "ide2"
    type    = "cloudinit" 
    storage = "local-lvm"
  }

  # Cloud-init static IP
  ipconfig0 = "ip=192.168.5.125/24,gw=192.168.5.1"

  # Cloud-init user and keys
  ciuser      = "yituadmin"
  cipassword = "Yitu@123"
  sshkeys = file("./secret/proxmox_key.pub")
}