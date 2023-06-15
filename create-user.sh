#!/bin/s

#Variables of colors
clear='\033[0m'
green='\033[0;32m'


#Script for creating user
ip=$(sed '13q;d' /etc/headscale/config.yaml)
ip=$(cut -c 13-200 <<< $ip)
echo "Name of the User?"
read name
headscale users create $name
key=$(headscale --user $name preauthkeys create --reusable --expiration 30m)
printf "${green}Use this command to login to Tailscale${clear}"
echo
echo "tailscale up --login-server $ip --authkey $key"
