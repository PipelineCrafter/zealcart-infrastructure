module "vpc" {
  source = "./modules/vpc"

  vpc_name = local.vpc_name
  vpc_cidr = var.vpc_cidr
}

module "subnets" {
  source = "./modules/subnets"

  vpc_id = module.vpc.vpc_id

  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr

  az1 = var.az1
  az2 = var.az2
}

module "igw" {
  source = "./modules/igw"

  vpc_id = module.vpc.vpc_id

  igw_name = local.igw_name
}

module "route_table" {
  source = "./modules/route-table"

  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.igw_id

  public_subnet_1_id = module.subnets.public_subnet_1_id
  public_subnet_2_id = module.subnets.public_subnet_2_id
}

module "eip" {
  source = "./modules/eip"

  eip_name = local.eip_name
}

module "nat" {
  source = "./modules/nat"

  allocation_id    = module.eip.eip_allocation_id
  public_subnet_id = module.subnets.public_subnet_1_id
}

module "private_route_table" {
  source = "./modules/private-route-table"

  vpc_id = module.vpc.vpc_id

  nat_gateway_id = module.nat.nat_gateway_id

  private_subnet_1_id = module.subnets.private_subnet_1_id
  private_subnet_2_id = module.subnets.private_subnet_2_id
}

module "security_group" {
  source = "./modules/security_group"

  vpc_id  = module.vpc.vpc_id
  sg_name = local.alb_sg_name
}

module "alb" {
  source = "./modules/alb"

  alb_name = local.alb_name

  public_subnet_1_id = module.subnets.public_subnet_1_id
  public_subnet_2_id = module.subnets.public_subnet_2_id

  alb_security_group_id = module.security_group.alb_security_group_id
}

module "target_group" {
  source = "./modules/target_group"

  vpc_id            = module.vpc.vpc_id
  target_group_name = local.target_group_name
  health_check_path = local.health_check_path
}

module "listener" {
  source = "./modules/listener"

  alb_arn          = module.alb.alb_arn
  target_group_arn = module.target_group.target_group_arn
}

module "ec2_security_group" {
  source = "./modules/ec2_security_group"

  vpc_id                = module.vpc.vpc_id
  ec2_sg_name           = local.ec2_sg_name
  alb_security_group_id = module.security_group.alb_security_group_id
}

module "asg" {
  source = "./modules/asg"

  asg_name           = local.asg_name
  launch_template_id = module.launch_template.launch_template_id

  private_subnet_1_id = module.subnets.private_subnet_1_id
  private_subnet_2_id = module.subnets.private_subnet_2_id

  target_group_arn = module.target_group.target_group_arn

  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity

  instance_name = local.instance_name
}

module "iam" {
  source = "./modules/iam"

  iam_role_name         = local.iam_role_name
  instance_profile_name = local.instance_profile_name
}

module "launch_template" {
  source = "./modules/launch_template"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  ec2_security_group_id = module.ec2_security_group.ec2_security_group_id

  iam_instance_profile_name = module.iam.instance_profile_name

  user_data = file("${path.module}/userdata.sh")

  instance_name = local.instance_name

  launch_template_name = local.launch_template_name
}

module "bastion_security_group" {
  source = "./modules/bastion_security_group"

  vpc_id          = module.vpc.vpc_id
  bastion_sg_name = local.bastion_security_group_name
  ssh_cidr        = var.ssh_cidr

}

module "bastion" {
  source = "./modules/bastion"

  public_subnet_id          = module.subnets.public_subnet_1_id
  bastion_security_group_id = module.bastion_security_group.bastion_security_group_id
  bastion_name              = local.bastion_name
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  key_name                  = var.key_name
}


module "rds_security_group" {
  source = "./modules/rds_security_group"

  vpc_id                = module.vpc.vpc_id
  rds_sg_name           = local.rds_sg_name
  ec2_security_group_id = module.ec2_security_group.ec2_security_group_id
}


module "db_subnet_group" {
  source = "./modules/db_subnet_group"

  db_subnet_group_name = local.db_subnet_group_name
  private_subnet_1_id  = module.subnets.private_subnet_1_id
  private_subnet_2_id  = module.subnets.private_subnet_2_id
}


module "rds" {
  source = "./modules/rds"

  db_identifier         = local.rds_name
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  db_instance_class     = var.db_instance_class
  engine_version        = var.engine_version
  multi_az              = var.multi_az
  db_subnet_group_name  = module.db_subnet_group.db_subnet_group_name
  rds_security_group_id = module.rds_security_group.rds_security_group_id
}
