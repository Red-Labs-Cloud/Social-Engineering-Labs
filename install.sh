#!/bin/bash

# Function to install common dependencies
function install_common_deps() {
  # Update package lists
  sudo apt update -y || sudo yum update -y

  # Install core dependencies (adjust based on your distro)
  sudo apt install -y curl wget || sudo yum install -y curl wget
}

# Function to install libreswan
function install_libreswan() {
  sudo apt install -y libreswan strongswan || sudo yum install -y libreswan
}

# Function to install Ansible
function install_ansible() {
  # Install dependencies for Ansible (adjust based on your distro)
  sudo apt install -y python3-pip || sudo yum install -y python3-pip

  # Install Ansible using pip
  sudo pip3 install ansible
}

# Function to deploy locally (no additional setup needed)
function deploy_local() {
  echo "Local deployment selected. No additional configuration required."
}

# Function to deploy to DigitalOcean (requires DOCTL configuration)
function deploy_digitalocean() {
  # Check if DOCTL is installed
  if ! command -v doctl &> /dev/null; then
    echo "DOCTL (DigitalOcean CLI) is not installed. Please install it following DigitalOcean's instructions: https://docs.digitalocean.com/reference/doctl/"
    return 1
  fi

  # Prompt for API token (store securely using environment variables)
  read -p "Enter your DigitalOcean API token: " do_api_token
  export DO_API_TOKEN=$do_api_token

  # Configure Ansible for DigitalOcean (adjust inventory file as needed)
  echo "[digitalocean]" >> inventory
  echo "localhost ansible_port=22 ansible_user=your_username private_key=~/.ssh/id_rsa" >> inventory
  ansible-playbook your_playbook.yml
}

# Function to deploy to AWS (requires AWS CLI configuration)
function deploy_aws() {
  # Check if AWS CLI is installed
  if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it following AWS's instructions: https://aws.amazon.com/cli/"
    return 1
  fi

  # Configure Ansible for AWS (adjust inventory file as needed)
  echo "[ec2]" >> inventory
  echo "localhost ansible_port=22 ansible_user=your_username" >> inventory
  # Add additional AWS-specific options (e.g., region, instance IDs)
  ansible-playbook your_playbook.yml
}

# Function to deploy to Azure (requires Azure CLI configuration)
function deploy_azure() {
  # Check if Azure CLI is installed
  if ! command -v az &> /dev/null; then
    echo "Azure CLI is not installed. Please install it following Azure's instructions: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows"
    return 1
  fi

  # Configure Ansible for Azure (adjust inventory file as needed)
  # ... (implementation details for Azure-specific configuration)
  ansible-playbook your_playbook.yml
}

# Function to deploy to Cloudflare (requires Cloudflare CLI configuration)
function deploy_cloudflare() {
  # Check if Cloudflare CLI is installed
  if ! command -v cfd &> /dev/null; then
    echo "Cloudflare CLI is not installed. Please install it following Cloudflare's instructions: https://dash.cloudflare.com/apps/37D_SlOigYcc/install?version=1.0.2"
    return 1
  fi

  # Configure Ansible for Cloudflare (adjust inventory file as needed)
  # ... (implementation details for Cloudflare-specific configuration)
  ansible-playbook your_playbook.yml
}

# Main script execution

# Install common dependencies
install_common_deps

# Install libreswan (optional)
# uncomment the following line if you need libreswan
# install_libreswan

# Install Ansible
install_ansible

# Get user input for deployment type
read -p "Enter deployment type (local, digitalocean, aws, azure, cloudflare): " deployment_type

# Call the appropriate deployment function based on user input
case "$deployment_type" in
  local)
    deploy_local
    ;;
  digitalocean)
    deploy_digitalocean
    ;;
  aws)
    deploy_aws
    ;;



sudo systemctl daemon-reload
sudo systemctl enable socat.service
sudo systemctl start socat.service
