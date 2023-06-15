#!/bin/sh
#Updates the System
apt update && apt upgrade -y

#Installs requierd apt
apt install wget nano -y

#Installs Headscale
wget --output-document=headscale.deb   https://github.com/juanfont/headscale/releases/download/v0.22.3/headscale_0.22.3_linux_amd64.deb
sudo dpkg --install headscale.deb

#Asks basic Configuration for headscale
echo "What is the server IP or DNS? Default: 0.0.0.0"
read headscaleip
headscaleip=${headscaleip:-0.0.0.0}
sed -i "s!server_url: http://.*:8080!server_url: http://$headscaleip:8080!" /etc/headscale/config.yaml

#Enables and Starts the headscale server
sudo systemctl enable headscale
sudo systemctl start headscale

#Removes the headscale.deb
rm -f headscale.deb
