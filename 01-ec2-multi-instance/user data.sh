#!/bin/bash

# Create a directory for Terraform initialization
mkdir -p /opt/terraform

# Create a file showing that the server was initialized
echo "Linux EC2 initialized using Terraform User Data" > /opt/terraform/terraform-init.txt

# Get basic server information
HOSTNAME=$(hostname)
OS=$(cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f 2)

# Save server information
cat > /opt/terraform/server-info.txt <<EOF
Hostname: $HOSTNAME
Operating System: $OS
Initialized By: Terraform
EOF