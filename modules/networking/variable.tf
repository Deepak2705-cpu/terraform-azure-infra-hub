variable "resource_group_name" { type = string }
variable "location"            { type = string }
variable "environment"         { type = string }
variable "vnet_address_space"  { type = string }
variable "subnet_prefixes"     { type = map(string) }
