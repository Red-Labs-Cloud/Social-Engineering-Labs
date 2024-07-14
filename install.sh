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
    echo "                                                                                                                         ";
    echo -e "${GREEN}         Website: https://redlabs.cloud/                                                           ${ENDCOLOR}";
    echo -e "${GREEN}         Author: RFS                                                                               ${ENDCOLOR}";
    echo "                                                                                                                         ";   
    echo "                                                                                                                         ";
    echo -e "${RED}           Social Engineering Labs                                                                   ${ENDCOLOR}";
    echo -e "${RED}           Discord: https://discord.redlabs.cloud/                                                   ${ENDCOLOR}";
    echo "                                                                                                                         ";
    echo "                                                                                                                         ";
    echo -e "${GREEN}         Digital Ocean 100$ credit ${ENDCOLOR} : ${RED} https://redlabs.cloud/                     ${ENDCOLOR}"; 
    echo -e "${GREEN}         Hack The Box Pro labs ${ENDCOLOR} : ${RED} https://redlabs.cloud/                         ${ENDCOLOR}"; 
    echo "                                                                                                              ${ENDCOLOR}";
}

lab()
{

echo -e "${RED} ----------------------------------------------------------------------------------${ENDCOLOR}";
echo -e "${YELLOW} | Frameworks/Apps   |           Access                 |      Functions       |${ENDCOLOR}";
echo -e "${GREEN}  | GoPhish           | http://gophish.localhost:3000    |  Phishing campaigns  |${ENDCOLOR}";
echo -e "${GREEN}  | EvilGinx          | http://evilginx.localhost:3000   |  MFA                 |${ENDCOLOR}";
echo -e "${GREEN}  | Modlishka         | http://modlishka.localhost:3000  |  Description         |${ENDCOLOR}";
echo -e "${GREEN}  | Muraena           | http://muraena.localhost:3000    |  Description         |${ENDCOLOR}";
echo -e "${GREEN}  | EvilnoVNC         | http://evilnovnc.localhost:3000  |  Description         |${ENDCOLOR}";
echo -e "${RED} ----------------------------------------------------------|----------------------|${ENDCOLOR}";
echo -e "${YELLOW} | Dashboards   |     URL                 |         Technology                 |${ENDCOLOR}";
echo -e "${GREEN}  | Traefik      | http://10.10.11.5:5000/ |  Docker proxies                    |${ENDCOLOR}";
echo -e "${GREEN}  | PGAdmin      | http://10.10.11.5:5000/ |  Postgresql Dashboard              |${ENDCOLOR}";
echo -e "${RED} ---------------------------------------------------------------------------------|${ENDCOLOR}";


}



build_lab()
{
    echo -e "${GREEN}[*] Downloading Composer file....${ENDCOLOR}"
    sudo curl -sS https://social-engineering.redlabs.cloud/docker-compose.yml --output $FOLDER/docker-compose.yml
    sudo curl -sS https://social-engineering.redlabs.cloud/config --output $FOLDER/config
    echo -e "${GREEN}[*] RFS is building the LAB... ${ENDCOLOR}"
    sudo docker-compose -f $FOLDER/docker-compose.yml up -d --quiet-pull
    sudo docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"
}



check_command()
{
    if which docker >/dev/null; then
    echo "Docker exists"
    else
        echo "Docker does not exist - Installing..."
        install_common_deps
    fi

}


banner
folder_validation
check_command

build_lab
lab