# modules/proxmox-vm/variables.tf - contains declarations of variables used in main.tf

variable "vmid" {
  description = "VM ID (301, 302, etc.)"
  type        = number
}

variable "name" {
  description = "VM name (e.g., k8s-master-01)"
  type        = string
}

variable "target_node" {
  description = "Proxmox node name where the VM will be deployed"
  type        = string
  default     = "pve"
}

variable "clone_template" {
  description = "Name of the base Cloud-Init template to clone"
  type        = string
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
}

variable "ram_mb" {
  description = "RAM allocated to the VM in MB (e.g., 8192)"
  type        = number
}

variable "boot_storage" {
  description = "Storage pool for the boot disk and cloud-init (e.g., local-lvm)"
  type        = string
}

variable "data_storage" {
  description = "Storage pool for the data disk (e.g., local-ssd)"
  type        = string
}

variable "boot_disk_size" {
  description = "Size of the primary boot disk (e.g., 40G)"
  type        = string
}

variable "data_disk_size" {
  description = "Size of the secondary data disk (e.g., 100G)"
  type        = string
}

variable "network_bridge" {
  description = "Network bridge to connect to (e.g., vmbr0)"
  type        = string
  default     = "vmbr0"
}

variable "ci_user" {
  description = "Cloud-init username"
  type        = string
}

variable "ssh_public_key" {
  description = "The public SSH key content for Cloud-init authorization"
  type        = string
}

variable "ip_address" {
  description = "Static IPv4 address (e.g., 192.168.5.201)"
  type        = string
}

variable "gateway" {
  description = "Network gateway"
  type        = string
}

