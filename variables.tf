variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "East US"
}

variable "environment" {
  description = "Environment name — dev, stage, or prod"
  type        = string
}

variable "vnet_address_space" {
  description = "CIDR address space for the Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_prefixes" {
  description = "Map of subnet names to CIDR prefixes"
  type        = map(string)
  default = {
    app   = "10.0.1.0/24"
    db    = "10.0.2.0/24"
    admin = "10.0.3.0/24"
  }
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}
