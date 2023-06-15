#!/bin/s
#Colors
clear='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

headscale user list
echo -e "${cyan}What user do you want to remove${clear}"
read remove
headscale user destroy $remove
