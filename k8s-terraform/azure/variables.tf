
variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 3
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "azureadmin"
}

variable "region" {
  type    = string
  default = "eastus"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "base_project_name" {
  type = string
  default = "bg5-dev-eus"
}
