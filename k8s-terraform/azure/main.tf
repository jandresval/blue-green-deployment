# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.104.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "<azure_subscription_id>"
  # tenant_id         = "<azure_subscription_tenant_id>"
  # client_id         = "<service_principal_appid>"
  # client_secret     = "<service_principal_password>"

  # skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
}

module "infrastructure" {
  source            = "./modules/infrastructure"
  base_project_name = "${var.project_name}-${var.environment}-${var.location}"
  region            = var.region
  location          = var.location
}

module "container_app" {
  source              = "./modules/container_app"
  base_project_name   = "${var.project_name}-${var.environment}-${var.location}"
  resource_group_name = module.infrastructure.resource_group_name
  environment_id      = module.infrastructure.container_app_environment_id
  common_tags         = local.common_tags
}

locals {
  common_tags = {
    Project = var.project_name
    Env     = var.environment
  }
}
