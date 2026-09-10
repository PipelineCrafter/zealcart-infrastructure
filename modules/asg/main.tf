resource "aws_autoscaling_group" "this" {
  name = var.asg_name

  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity

  vpc_zone_identifier = [ var.private_subnet_1_id, var.private_subnet_2_id ]

  target_group_arns = [
    var.target_group_arn
  ]

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }
  tag {
  key                 = "Name"
  value               = var.instance_name
  propagate_at_launch = true
}
}
