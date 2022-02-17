#!/bin/bash

# POSITIONAL_ARGS=()

# while [[ $# -gt 0 ]]; do
#   case $1 in
#     -i|--ip)
#       IP="$2"
#       shift # past argument
#       shift # past value
#       ;;
#     -f|--file)
#       FILE="$2"
#       shift # past argument
#       shift # past value
#       ;;
#     --default)
#       DEFAULT=YES
#       shift # past argument
#       ;;
#     -*|--*)
#       echo "Unknown option $1"
#       exit 1
#       ;;
#     *)
#       POSITIONAL_ARGS+=("$1") # save positional arg
#       shift # past argument
#       ;;
#   esac
# done

# set -- "${POSITIONAL_ARGS[@]}"

# Getting IP/Domain through Arguments
ip=$1

# Running Nmap with probe network and all ports args to make sure every port is scanned
sudo nmap $ip -Pn -p- -n -sX --disable-arp-ping --stats-every 10 -v10 --max-parallelism 10 -oA nmap_scan

# Finding all the open ports from Nmap result generated file "nmap_scan.nmap" and storing them in ports file
grep 'open' nmap_scan.nmap | cut -d '/' -f1 | paste -d, -s - > ports;

# Storing content of ports file into ports variable
ports=$(cat ports); 

# Removing the ports file as we no longer need it
rm ports;

# Running detialed Nmap scan using provided IP/Domain and discovered open ports
sudo nmap $ip -p T:$ports -Pn -sCV -v10 --script=vuln,safe,discovery -oN nmap_full_report.nmap