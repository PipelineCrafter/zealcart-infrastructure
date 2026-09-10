resource "aws_security_group" "this" {
  name        = var.rds_sg_name
  description = "Security Group for RDS MySQL"
  vpc_id      = var.vpc_id

  ingress {
    description              = "MySQL from EC2"
    from_port                = 3306
    to_port                  = 3306
    protocol                 = "tcp"
    security_groups = [var.ec2_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.rds_sg_name
  }
}
