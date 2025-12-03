# modules/proxmox-vm/outputs.tf

output "ip_address" {
  description = "IP address of the VM"
  value       = proxmox_vm_qemu.ubuntu.default_ipv4_address
}

output "vmid" {
  description = "VM ID"
  value       = proxmox_vm_qemu.ubuntu.vmid
}

output "name" {
  description = "VM name"
  value       = proxmox_vm_qemu.ubuntu.name
}

