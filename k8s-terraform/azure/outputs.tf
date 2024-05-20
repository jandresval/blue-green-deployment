output "resource_group_name" {
  value = module.infrastructure.resource_group_name
}

output "container_app_environment_id" {
  value = module.infrastructure.container_app_environment_id
}

output "latest_revision_url" {
  value = module.container_app.latest_revision_url
}

output "latest_revision_name" {
  value = module.container_app.latest_revision_name
}
