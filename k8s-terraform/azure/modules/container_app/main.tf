resource "azurerm_container_app" "api_container_app" {
  name = "${var.base_project_name}-ca"

  container_app_environment_id = var.environment_id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  template {
    container {
      name   = "examplecontainerapp"
      image  = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }

  ingress {
    allow_insecure_connections = false
    external_enabled           = true
    target_port                = 8080

    traffic_weight {
      label           = "stable"
      percentage      = 100
      latest_revision = true
    }
  }

  tags = var.common_tags
}

output "latest_revision_url" {
  value = azurerm_container_app.api_container_app.latest_revision_fqdn
}

output "latest_revision_name" {
  value = azurerm_container_app.api_container_app.latest_revision_name
}
