terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "deepaktfstatestorage"
    container_name       = "tfstate"
    key                  = "infra-hub.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# -----------------------------------------------
# Resource Group
# -----------------------------------------------
resource "azurerm_resource_group" "main" {
  name     = "${var.environment}-infra-rg"
  location = var.location

  tags = {
    environment = var.environment
    project     = "terraform-azure-infra-hub"
    managed_by  = "Terraform"
    owner       = "Deepak TR"
  }
}

# -----------------------------------------------
# Networking Module
# -----------------------------------------------
module "networking" {
  source              = "./modules/networking"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  environment         = var.environment
  vnet_address_space  = var.vnet_address_space
  subnet_prefixes     = var.subnet_prefixes
}

# -----------------------------------------------
# Compute Module
# -----------------------------------------------
module "compute" {
  source              = "./modules/compute"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  environment         = var.environment
  subnet_id           = module.networking.subnet_id
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

# -----------------------------------------------
# Storage Module
# -----------------------------------------------
module "storage" {
  source              = "./modules/storage"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  environment         = var.environment
}
