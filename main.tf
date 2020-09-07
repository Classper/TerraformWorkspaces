resource "azurerm_resource_group" "main" {
  name     = "myTFResourceGroup"
  location = "West Europe"
}

# Create a virtual network in the production-resources resource group
resource "azurerm_virtual_network" "main" {
  name                = "vnet-casper-dev"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_container_group" "example" {
  name                = "continst01"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_address_type     = "public"
  os_type             = "Linux"

  container {
    name   = "echo-api"
    image  = "asizikov/echo-api:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 443
      protocol = "TCP"
    }
  }
}
