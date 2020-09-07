terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-7109"
    storage_account_name = "terraformbackend21106"
    container_name       = "tfstates-network-3682"
    key                  = "terraform.tfstate"
  }
}
