#!/bin/bash
# Execute com sudo.
apt-get update
apt-get install software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt install -y ansible python3-boto3
