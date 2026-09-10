output "vpc_id" {
  value = module.vpc.vpc_id
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}
