
#!/usr/bin/env bash

# Social LAB
# Author: RFS 
# Version: 0.1



RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"




echo -e "${RED}[*] Please run as root ${ENDCOLOR}"

banner
RUNNING=$(sudo docker ps -a | sudo wc -l)


echo "You have $RUNNING Dockers"

sudo docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"
sudo docker system prune -a -f --volumes

# Stop All Conteinrs
sudo docker stop $(sudo docker ps -a -q)

# Remove all containers
sudo docker rm $(sudo docker ps -a -q)
 
# Remove all container images
sudo docker rmi $(sudo docker images -q) 