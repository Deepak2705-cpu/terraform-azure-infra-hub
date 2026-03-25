output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "vnet_id" {
  value = module.networking.vnet_id
}

output "subnet_id" {
  value = module.networking.subnet_id
}

output "vm_private_ip" {
  value = module.compute.vm_private_ip
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}
