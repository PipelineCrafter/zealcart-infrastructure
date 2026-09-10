resource "aws_lb_target_group" "this" {
  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path    = var.health_check_path
    protocol = "HTTP"
  }

  tags = {
    Name = var.target_group_name
  }
}
