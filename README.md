# 🚀 ZealCart Infrastructure

A production-style AWS Infrastructure project built using **Terraform** with reusable modules. This project demonstrates a highly available architecture following DevOps and Infrastructure as Code (IaC) best practices.

## Architecture

- VPC with Public & Private Subnets
- Internet Gateway & NAT Gateway
- Application Load Balancer (ALB)
- Auto Scaling Group (ASG)
- Launch Template
- IAM Role & Instance Profile
- Bastion Host
- Amazon RDS MySQL
- DB Subnet Group
- Security Group based communication

## AWS Services Used

- Amazon VPC
- Amazon EC2
- Auto Scaling
- Elastic Load Balancer
- IAM
- Amazon RDS (MySQL)
- NAT Gateway
- Route Tables

## Project Structure

```text
modules/
├── alb/
├── asg/
├── bastion/
├── bastion_security_group/
├── db_subnet_group/
├── ec2_security_group/
├── iam/
├── launch_template/
├── listener/
├── nat/
├── private_route_table/
├── rds/
├── rds_security_group/
├── route_table/
├── subnets/
├── target_group/
└── vpc/
```

## Learning Outcomes

- Modular Terraform Architecture
- High Availability across two Availability Zones
- IAM Role vs Instance Profile
- Security Group based access control
- Launch Template with Auto Scaling Group
- Private RDS deployment using DB Subnet Group

## Author

**Abdul Khadar Zeelan**  
DevOps Engineer | AWS | Terraform
