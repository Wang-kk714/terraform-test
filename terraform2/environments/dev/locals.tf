locals {
  # Shared defaults to keep per-VM blocks minimal and consistent
  default_boot_storage  = "local-lvm"
  default_data_storage  = "local-lvm"
  performance_storage   = "local_ssd"
  default_gateway       = "192.168.5.1"
}

