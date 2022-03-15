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

variable "rds_ingress_ports" {
  description = "Postgres RDS ingress ports"
  default     = [5432]
}

variable "db_password" {
  description = "DB Password"
  validation {
    condition = length(var.db_password) >= 8
    error_message = "DB Password must be at least 8 characters"
  }
}