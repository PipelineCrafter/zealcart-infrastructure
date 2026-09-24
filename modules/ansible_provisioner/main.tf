resource "null_resource" "configure_servers" {

  provisioner "local-exec" {
    command = <<EOT
cd ${path.root}/ansible && \
ansible-playbook \
  -i inventories/aws/aws_ec2.yml \
  playbooks/install_docker.yml \
  -u ubuntu \
  --private-key=/home/abdul/abdul-key.pem \
  --vault-password-file .vault_pass && \
ansible-playbook \
  -i inventories/aws/aws_ec2.yml \
  playbooks/deploy_nginx.yml \
  -u ubuntu \
  --private-key=/home/abdul/abdul-key.pem \
  --vault-password-file .vault_pass
EOT
  }
}