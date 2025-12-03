# versions.tf - contains version requirements for Terraform and providers
# Each module that uses a provider MUST declare required_providers

terraform {
  required_version = ">= 1.0"

  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc05"
    }
  }
}

