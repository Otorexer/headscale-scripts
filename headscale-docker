#!/bin/sh
#Updates the System
apt update && apt upgrade -y

#Install required Programs
apt install wget nano docker.io -y

#Configures headscale
mkdir -p ./headscale/config
cd ./headscale
touch ./config/db.sqlite
touch ./config/config.yaml
echo # Change to your hostname or host IP >> ./config/config.yaml
echo server_url: http://your-host-name:8080 >> ./config/config.yaml
echo # Listen to 0.0.0.0 so it's accessible outside the container >> ./config/config.yaml
echo metrics_listen_addr: 0.0.0.0:9090 >> ./config/config.yaml
echo private_key_path: /etc/headscale/private.key >> ./config/config.yaml
echo noise: >> ./config/config.yaml
echo private_key_path: /etc/headscale/noise_private.key >> ./config/config.yaml
echo db_type: sqlite3 >> ./config/config.yaml
echo db_path: /etc/headscale/db.sqlite >> ./config/config.yaml
echo  >> ./config/config.yaml
echo  >> ./config/config.yaml
echo  >> ./config/config.yaml
docker run --name headscale --detach --volume $(pwd)/config:/etc/headscale/ --publish 0.0.0.0:8080:8080 --publish 0.0.0.0:9090:9090 headscale/headscale:<VERSION> headscale serve
docker ps
