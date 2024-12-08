#!/bin/bash

cd terraform
terraform init
terraform apply -auto-approve
CONTROLLER_PUBLIC_IP=$(terraform output -json | jq -r '.controller_public_ip.value')
WORKER01_PUBLIC_IP=$(terraform output -json | jq -r '.worker01_public_ip.value')
WORKER02_PUBLIC_IP=$(terraform output -json | jq -r '.worker02_public_ip.value')

cd ../ansible
cat<<EOF > inventory.ini
[control_plane]
controller ansible_host=$CONTROLLER_PUBLIC_IP ansible_user=ubuntu ansible_private_key_file=~/labsuser.pem ansible_ssh_extra_args='-o StrictHostKeyChecking=no'

[worker_plane]
worker01 ansible_host=$WORKER01_PUBLIC_IP ansible_user=ubuntu ansible_private_key_file=~/labsuser.pem ansible_ssh_extra_args='-o StrictHostKeyChecking=no'
worker02 ansible_host=$WORKER02_PUBLIC_IP ansible_user=ubuntu ansible_private_key_file=~/labsuser.pem ansible_ssh_extra_args='-o StrictHostKeyChecking=no'
EOF

ansible-playbook -v -i inventory.ini playbook.yml

echo "Execute o comando abaixo para entrar no controller."
echo "ssh -i ~/labsuser.pem ubuntu@${CONTROLLER_PUBLIC_IP}"
