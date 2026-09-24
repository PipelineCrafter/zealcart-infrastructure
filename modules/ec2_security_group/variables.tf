variable "vpc_id" {
  type = string
}

variable "ec2_sg_name" {
  type = string
}

variable "alb_security_group_id" {
  type = string
}

variable "bastion_security_group_id" {
  type = string
}

variable "ssh_cidr" {
  description = "CIDR allowed for SSH access"
  type        = string
}