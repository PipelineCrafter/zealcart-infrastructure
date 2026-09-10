resource "aws_db_instance" "this" {
  identifier             = var.db_identifier
  db_name                = var.db_name

  engine                 = "mysql"
  engine_version         = var.engine_version

  instance_class         = var.db_instance_class

  allocated_storage      = 20
  storage_type           = "gp3"

  username               = var.db_username
  password               = var.db_password

  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [var.rds_security_group_id]

  multi_az               = var.multi_az
  publicly_accessible    = false

  skip_final_snapshot    = true
}
