#!/bin/bash

cd terraform
#terraform init
#terraform apply -auto-aprove
CONTROLLER_PUBLIC_IP=$(terraform output -json | jq -r '.controller_public_ip.value')
WORKER01_PUBLIC_IP=$(terraform output -json | jq -r '.worker01_public_ip.value')
WORKER02_PUBLIC_IP=$(terraform output -json | jq -r '.worker02_public_ip.value')

cd ../ansible
cat<<EOF > inventory.ini
[controller]
controller ansible_host=$CONTROLLER_PUBLIC_IP ansible_user=ubuntu ansible_private_key_file=~/labuser.pem ansible_ssh_extra_args='-o StrictHostKeyChecking=no'

[worker01]
controller ansible_host=$WORKER01_PUBLIC_IP ansible_user=ubuntu ansible_private_key_file=~/labuser.pem ansible_ssh_extra_args='-o StrictHostKeyChecking=no'

[worker02]
controller ansible_host=$WORKER02_PUBLIC_IP ansible_user=ubuntu ansible_private_key_file=~/labuser.pem ansible_ssh_extra_args='-o StrictHostKeyChecking=no'
EOF

ansible-playbook -i inventory.ini playbook.yml


echo "ssh -i ~/labsuser.pem ubuntu@${CONTROLLER_PUBLIC_IP}"
