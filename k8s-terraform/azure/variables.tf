variable "region" {
  description = "Azure infrastructure region"
  type        = string
  default     = "eastus"
}

variable "location" {
  description = "Azure infrastructure region abbreviation"
  type        = string
  default     = "eus"
}

variable "environment" {
  description = "Application environment"
  type        = string
  default     = "dev"
}

variable "container_app_name" {
  description = "Container app name"
  type        = string
  default     = "api"
}

variable "project_name" {
  description = "Used for naming resources"
  type        = string
  default     = "bg"
}

locals {
  default_tags = {
    environment  = var.environment
    owner        = "J.Son"
    project_name = var.project_name
  }
}
