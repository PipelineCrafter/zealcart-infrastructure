variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  type    = string
  default = "zealcart"
}

variable "environment" {
  default = "prod"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_1_cidr" {
  type    = string
  default = "10.10.1.0/24"
}

variable "public_subnet_2_cidr" {
  type    = string
  default = "10.10.2.0/24"
}

variable "private_subnet_1_cidr" {
  type    = string
  default = "10.10.3.0/24"
}

variable "private_subnet_2_cidr" {
  type    = string
  default = "10.10.4.0/24"
}

variable "az1" {
  type    = string
  default = "ap-south-1a"
}

variable "az2" {
  type    = string
  default = "ap-south-1b"
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "desired_capacity" {
  type = number
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "ssh_cidr" {
  description = "Public IP allowed to SSH into Bastion Host"
  type        = string
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

variable "domain_name" {
  type = string
}

variable "sub_domain_name" {
  type = string
}


