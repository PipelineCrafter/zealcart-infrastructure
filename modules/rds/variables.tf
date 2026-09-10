variable "db_identifier" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "db_instance_class" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "multi_az" {
  type = bool
}

variable "db_subnet_group_name" {
  type = string
}

variable "rds_security_group_id" {
  type = string
}
