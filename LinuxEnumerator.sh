#!/bin/bash

# Common linux commands for enumeration and privilege escalation

# Color constants
RESET='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'

# User groups

if id_output=$("id"); then
    echo -e "$GREEN[*] User groups\n$RESET"
    echo -e "$id_output"
    echo -e "$RESET"
else
    echo -e "$RED[!] Error with group enumeration"
    echo -e "$RESET"
fi

# Environment variables
if env_output=$("env"); then
    echo -e "$GREEN[*] Environment variables\n$RESET"
    echo -e "$env_output"
    echo -e "$RESET"
else
    echo -e "$RED[!] Error with environment enumeration"
    echo -e "$RESET"
fi
echo "==========================================================================================="
# Network information

if ip_output=$(ip a); then
    echo -e "$GREEN[*] IP address information\n$RESET"
    echo -e "$ip_output"
    echo -e "$RESET"
else
    echo -e "$RED[!] Error with IP address enumeration"
    echo -e "$RESET"
fi
echo "==========================================================================================="
# Network ports (ss)
if ss_output=$(ss -tulpn); then
    echo -e "$GREEN[*] Network ports\n$RESET"
    echo -e "$ss_output"
else
    echo -e "$RED[!] Error with network ports enumeration"
    echo -e "$RESET"    
fi
echo "==========================================================================================="
# Kernel informations
if uname_output=$(uname -a); then
    echo -e "$GREEN[*] Kernel information\n$RESET"
    echo -e "$uname_output"
    echo -e "$RESET"
else
    echo -e "$RED[!] Error with kernel information enumeration"
    echo -e "$RESET"
fi

echo "==========================================================================================="
# Running processes

if ps_output=$(ps aux); then
    echo -e "$GREEN[*] Running processes\n$RESET"
    echo -e "$ps_output"
    echo -e "$RESET"
else
    echo -e "$RED[!] Error with running processes enumeration"
    echo -e "$RESET"
fi

# Interesting directories

get_interesting_directories() {
    folder_name=$1
    if ls_output=$(ls -la $folder_name); then
        echo -e "$GREEN[*] $folder_name directory\n$RESET"
        echo -e "$ls_output"
        echo -e "$RESET"
    else
        echo -e "$RED[!] Error with $folder_name enumeration"
        echo -e "$RESET"
    fi
}

echo "==========================================================================================="

# /opt folder
get_interesting_directories "/"
get_interesting_directories "/opt"
get_interesting_directories "/var/backups"
get_interesting_directories "/var/www/html"
get_interesting_directories "/var/mail"
get_interesting_directories "/var/opt"
get_interesting_directories "/var/tmp"
get_interesting_directories "/home"

echo -e "$YELLOW[i] Remember to run pspy!"
echo -e "$RESET"
