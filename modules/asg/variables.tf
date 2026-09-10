variable "asg_name" {
    type = string
}

variable "launch_template_id" {
    type = string
}

variable "private_subnet_1_id" {
    type = string
}

variable "private_subnet_2_id" {
    type = string
}

variable "target_group_arn" {
    type = string
}

variable "desired_capacity" {
    type = string
}

variable "min_size" {
    type = string
}

variable "max_size" {
    type = string
}

variable "instance_name" {
  type = string
}
