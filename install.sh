#!/usr/bin/env bash

# Social Engineer LAB
# Author: RFS 
# Web: https://social-engineering.redlabs.cloud/
# Discord: 
# OS: Debian/Ubuntu/Kali
# Version: 0.1


FOLDER="$HOME/Projects/SocialEng_LAB"
DOMAIN="social-engineering.redlabs.cloud"



##Shell Colors
YELLOW="\e[33m"
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"


folder_validation(){
    if [ ! -d $FOLDER ]
    then
        echo -e "${GREEN}[*] Creating $FOLDER ... \n${ENDCOLOR}"
        sudo mkdir -p $FOLDER
        sudo mkdir -p $FOLDER/logs
    fi
}

# Function to install common dependencies
function install_common_deps() {
  sudo apt update -y
  sudo apt install -y curl git unzip wget docker.io docker-compose
}


banner()
{
    clear
    echo "                                                                                                                        ";
    echo -e "${GREEN}           Website: https://redlabs.cloud/                                                        ${ENDCOLOR}";
    echo "                                                                                                                        ";   
    echo "                                                                                                                        ";
    echo -e "${RED}          Social Engineering Labs                                                                   ${ENDCOLOR}";
    echo -e "${RED}           Discord: https://discord.redlabs.cloud/                                                  ${ENDCOLOR}";
    echo -e "${GREEN}           Author: RFS                                                                            ${ENDCOLOR}";
    
}

lab()
{

echo -e "${RED} --------------------------------------------------------${ENDCOLOR}";
echo -e "${YELLOW} | Frameworks/Apps           |    Local Domain          |      Technology    |${ENDCOLOR}";
echo -e "${GREEN} | GoPhish  | http://gophish.localhost:3000  |  Phishing campaigns  |${ENDCOLOR}";
echo -e "${RED} --------------------------------------------------------${ENDCOLOR}";
echo -e "${YELLOW} | Dashboards     |     URL  |      Technology         |${ENDCOLOR}";
echo -e "${GREEN} | VAmPI OK   | http://10.10.11.5:5000/ |  API Testing             |${ENDCOLOR}";
echo -e "${RED} --------------------------------------------------------${ENDCOLOR}";


}



build_lab()
{
    echo -e "${GREEN}[*] Downloading Composer file....${ENDCOLOR}"
    sudo curl -sS https://social-engineering.redlabs.cloud/docker-compose.yml --output $FOLDER/docker-compose.yml
    echo -e "${GREEN}[*] RFS is building the LAB... ${ENDCOLOR}"
    sudo docker-compose -f $FOLDER/docker-compose.yml up -d --quiet-pull
    sudo docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"
}



check_command()
{
    if which docker >/dev/null; then
    echo "docker exists"
    else
        echo " docker does not exist"
    fi

}


banner
folder_validation
install_common_deps
build_lab
lab