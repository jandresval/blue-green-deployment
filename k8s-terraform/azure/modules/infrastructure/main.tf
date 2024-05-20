resource "azurerm_resource_group" "rg" {
  name     = "${var.base_project_name}-rg"
  location = var.region
}

resource "azurerm_container_app_environment" "env" {
  name                = "${var.base_project_name}-cae"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  depends_on = [
    azurerm_resource_group.rg
  ]
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "container_app_environment_id" {
  value = azurerm_container_app_environment.env.id
}
