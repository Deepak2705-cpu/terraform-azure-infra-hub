output "vm_id" {
  value = azurerm_linux_virtual_machine.main.id
}

output "vm_private_ip" {
  value = azurerm_network_interface.main.private_ip_address
}

output "vm_public_ip" {
  value = azurerm_public_ip.main.ip_address
}
