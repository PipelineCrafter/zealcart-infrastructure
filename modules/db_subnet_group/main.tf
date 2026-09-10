resource "aws_db_subnet_group" "this" {
  name = var.db_subnet_group_name

  subnet_ids = [
    var.private_subnet_1_id,
    var.private_subnet_2_id
  ]

  tags = {
    Name = var.db_subnet_group_name
  }
}
