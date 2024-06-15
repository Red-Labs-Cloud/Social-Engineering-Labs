#!/bin/bash



# Function to install common dependencies
function install_common_deps() {
  sudo apt update -y
  sudo apt install -y curl wget
}


