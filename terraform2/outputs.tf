# outputs.tf - contains outputs from the resources created in main.tf

output "master_ip" {
  description = "IP address of the K8s Master node"
  value       = module.dev.master_ip
}

output "woker1_ip" {
  description = "IP address of the main K8s Worker node"
  value       = module.dev.woker1_ip
}

output "woker2_ip" {
  description = "IP address of the dev K8s Worker node"
  value       = module.dev.woker2_ip
}

output "ssh_command_master" {
  description = "Example SSH command to connect to the Master node"
  value       = module.dev.ssh_command_master
}
