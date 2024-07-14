#!/usr/bin/env bash

# Social Engineer LAB
# Author: RFS 
# Web: https://social-engineering.redlabs.cloud/
# Discord: 
# OS: Debian/Ubuntu/Kali
# Version: 0.1




# Function to install common dependencies
function install_common_deps() {
  sudo apt update -y
  sudo apt install -y curl git unzip wget docker docker-compose
}


banner()
{
    clear
    echo "                                                                                                                       ";
    echo -e "${GREEN}           Website: https://redlabs.cloud/                                                        ${ENDCOLOR}";
    echo "                                                                                                                       ";   
    echo "                                                                                                                       ";
    echo -e "${RED}          Social Engineering Labs                                        ${ENDCOLOR}";
    echo -e "${RED}           Discord: https://discord.redlabs.cloud/                           ${ENDCOLOR}";
    echo -e "${GREEN}           Author: RFS                                                                            ${ENDCOLOR}";
    
}



banner()
install_common_deps()