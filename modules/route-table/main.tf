resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  tags = {
    Name = "shopkart-public-route-table"
  }
}

resource "aws_route" "internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = var.public_subnet_1_id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = var.public_subnet_2_id
  route_table_id = aws_route_table.public.id
}