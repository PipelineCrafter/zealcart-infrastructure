# 🚀 ZealCart Infrastructure

Production-style AWS infrastructure automated with **Terraform + Ansible** featuring High Availability, HTTPS, Dynamic Inventory, Docker provisioning, and Infrastructure as Code.

![Architecture](diagrams/zealcart-architecture-v2.png)

---

## 🏗 Architecture

Terraform provisions the infrastructure while Ansible automatically configures the servers.

**Workflow**

Terraform → AWS EC2 → Ansible Dynamic Inventory → Docker → Nginx → ZealCart

---

## ☁ AWS Services Used

- Amazon VPC
- Amazon EC2
- Auto Scaling Group
- Application Load Balancer
- Route 53
- AWS Certificate Manager (ACM)
- Amazon RDS (MySQL)
- IAM
- NAT Gateway
- Security Groups

---

## ⚙️ DevOps Stack

| Layer | Technology |
|--------|------------|
| Infrastructure | Terraform |
| Configuration | Ansible |
| Containerization | Docker |
| Web Server | Nginx |
| Cloud | AWS |

---

## 📁 Project Structure

```text
.
├── ansible/
│   ├── inventories/
│   ├── playbooks/
│   ├── roles/
│   ├── group_vars/
│   └── host_vars/
├── modules/
│   ├── vpc/
│   ├── alb/
│   ├── asg/
│   ├── launch_template/
│   ├── iam/
│   ├── rds/
│   └── ...
├── diagrams/
└── main.tf
```

---

## ✨ Production Features

### Terraform

- Modular Infrastructure as Code
- High Availability across 2 AZs
- Route 53 custom domain
- ACM SSL/TLS certificates
- HTTPS Load Balancer
- Auto Scaling Group
- Private RDS deployment

### Ansible

- Dynamic AWS Inventory using EC2 tags
- Reusable Ansible Roles
- Jinja2 Templates
- Handlers for service restarts
- Ansible Vault for secret management
- Automated Docker installation
- Nginx deployment using playbooks

---

## 🚀 Automated Deployment

Provision infrastructure:

```bash
terraform apply
```

Terraform automatically triggers Ansible:

```bash
ansible-playbook playbooks/install_docker.yml
ansible-playbook playbooks/deploy_nginx.yml
```

Result:

- EC2 instances provisioned
- Docker installed
- Nginx container deployed
- ZealCart application running automatically

---

## 🎯 Learning Outcomes

- Modular Terraform Design
- Dynamic Ansible Inventory
- Configuration Management
- Docker Automation
- Infrastructure + Configuration Integration
- Production-style DevOps Workflow

---

## 👨‍💻 Author

**Abdul Khadar Zeelan**

DevOps Engineer | AWS | Terraform | Ansible
