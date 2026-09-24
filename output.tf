output "vpc_id" {
  value = module.vpc.vpc_id
}

#output "alb_dns_name" {
#  value = module.alb.alb_dns_name
#}

#output "bastion_public_ip" {
#  value = module.bastion.bastion_public_ip
#}

#output "rds_endpoint" {
#  value = module.rds.rds_endpoint
#}

output "app_public_ip" {
  value = module.app_ec2.public_ip
}

output "db_public_ip" {
  value = module.db_ec2.public_ip
}

output "app_private_ip" {
  value = module.app_ec2.private_ip
}

output "db_private_ip" {
  value = module.db_ec2.private_ip
}
