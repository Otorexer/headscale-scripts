#!/bin/s
clear
#Colors
clear='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

#Script for creating user
ip=$(sed '13q;d' /etc/headscale/config.yaml)
ip=$(cut -c 13-200 <<< $ip)
echo -e "${cyan}Name of the User?${clear}"
read name
headscale users create $name
key=$(headscale --user $name preauthkeys create --reusable --expiration 30m)
echo -e "${cyan}Use this command to login to Tailscale${clear}"
echo "tailscale up --login-server $ip --authkey $key"
