resource "aws_security_group" "this" {

  name     = var.ec2_sg_name
  vpc_id   = var.vpc_id


  ingress  {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_security_group_id]
  }

  ingress {
  description = "HTTP from Internet (Lab)"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
  
  ingress {
  description     = "SSH from Bastion"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  security_groups = [var.bastion_security_group_id]
}

ingress {
  description = "SSH from My Laptop"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [var.ssh_cidr]
}

  egress  {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name            = var.ec2_sg_name 
  }
}
