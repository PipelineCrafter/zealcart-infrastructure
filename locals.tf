locals {
  prefix = "${var.project_name}-${var.environment}"

  vpc_name = "${local.prefix}-vpc"

  public_subnet_1_name = "${local.prefix}-public-subnet-1"
  public_subnet_2_name = "${local.prefix}-public-subnet-2"

  private_subnet_1_name = "${local.prefix}-private-subnet-1"
  private_subnet_2_name = "${local.prefix}-private-subnet-2"

  igw_name = "${local.prefix}-igw"
  eip_name = "${local.prefix}-nat-eip"
  nat_name = "${local.prefix}-nat-gateway"

  public_rt_name  = "${local.prefix}-public-route-table"
  private_rt_name = "${local.prefix}-private-route-table"

  alb_sg_name = "${local.prefix}-alb-sg"
  alb_name    = "${local.prefix}-alb"

  ec2_sg_name          = "${local.prefix}-ec2-sg"
  launch_template_name = "${local.prefix}-launch-template"
  instance_name        = "${local.prefix}-app-server"
  asg_name             = "${local.prefix}-asg"

  iam_role_name               = "${local.prefix}-ec2-role"
  instance_profile_name       = "${local.prefix}-ec2-profile"
  target_group_name           = "${local.prefix}-tg"
  health_check_path           = "/"
  name_prefix                 = "zealcart-prod"
  bastion_name                = "${local.name_prefix}-bastion"
  bastion_security_group_name = "${local.name_prefix}-bastion-sg"

  rds_name             = "${local.name_prefix}-mysql"
  db_subnet_group_name = "${local.name_prefix}-db-subnet-group"
  rds_sg_name          = "${local.name_prefix}-rds-sg"
}
