variable "azure_firewall_list" {
  type        = list(any)
  default     = []
  description = "list of azure firewall objects "
}

variable "resource_group_output" {
  type        = map(any)
  default     = {}
  description = "list of resource group objects "
}

variable "subnet_output" {
  type        = map(any)
  default     = {}
  description = "list of subnet objects "
}

variable "public_ip_output" {
  type        = map(any)
  default     = {}
  description = "list of public ip objects "
}

variable "azure_firewall_policy_output" {
  type        = map(any)
  default     = {}
  description = "list of firewall objects "
}

variable "default_values" {
  type = any
  default = {}
  description = "Provide default values for resource if not any"  
}