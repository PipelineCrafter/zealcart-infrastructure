resource "aws_lb" "this" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"

  security_groups = [var.alb_security_group_id]

  subnets = [
    var.public_subnet_1_id,
    var.public_subnet_2_id
  ]
}
