variable "rds_ingress_ports" {
  type        = list(string)
  description = "Postgres RDS ingress ports"
}

variable "vpc_workspace_name" {
  type        = string
  description = "VPC Workspace Name for Backed State"
}

variable "servers_workspace_name" {
  type        = string
  description = "Servers Workspace Name for Backed State"
}

variable "tfe_organization_name" {
  type        = string
  description = "TFE Organization Name"
}

variable "db_identifier_name" {
  type        = string
  description = "DB Identifier name"
}

variable "engine_version" {
  type        = string
  description = "DB Engine Version"
}
variable "instance_class" {
  type        = string
  description = "DB Instance class"
}
variable "db_username" {
  type        = string
  description = "DB Username"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnets_ids" {
  description = "List of subnets ids"
  type        = list(string)
}
