# outputs.tf for dev environment

output "master_ip" {
  description = "IP address of the K8s Master node"
  value       = module.master.ip_address
}

output "woker1_ip" {
  description = "IP address of the main K8s Worker node"
  value       = module.woker1.ip_address
}

output "woker2_ip" {
  description = "IP address of the dev K8s Worker node"
  value       = module.woker2.ip_address
}

output "ssh_command_master" {
  description = "Example SSH command to connect to the Master node"
  value       = "ssh ${var.default_user}@${module.master.ip_address} -i ~/.ssh/your_private_key"
}

