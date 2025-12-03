# variables.tf - contains declarations of variables used in main.tf

variable "pm_api_token_id" {
  description = "Proxmox API token ID"
  type        = string
  # sensitive   = true
}

variable "pm_api_token_secret" {
  description = "Proxmox API token secret"
  type        = string
  sensitive   = true
}

variable "base_template" {
  description = "Base Cloud-Init template name to clone"
  type        = string
  default     = "ubuntu-noble"
}

variable "ssh_key_path" {
  description = "Path to the SSH public key file (relative to root directory)"
  type        = string
  default     = "secret/proxmox_key.pub"
}

variable "default_user" {
  description = "Default SSH user for connecting to VMs"
  type        = string
  default     = "yituadmin"
}
