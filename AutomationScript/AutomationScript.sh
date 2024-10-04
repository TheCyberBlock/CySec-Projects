#!/bin/bash


# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# Reset
NC='\033[0m' 		  # No Color

# Variables
DirectoryName=$1
Domain=$(echo $2 | cut -d "/" -f 3)
Website=$2


# Check for Arguments
if [ $# -eq 0 ]
  	then
    		echo -e "$BRed No arguments supplied.......!!!\n"
		echo -e "$BGreen Usage: <script_name> output_directory website_url"
		echo -e "$White Example: ./AutomationScript.sh /tmp/Test http://test.com"
		exit 1
fi


# Making and Chaning Directory for Storing Output
mkdir $DirectoryName && cd $DirectoryName


# Installing Tools
Check_Tools () {
	printf "$BYellow==================================================================================\n"
	printf "				Installing Tools					  	\n"
	printf "==================================================================================$NC\n"
	sudo apt install host dnsrecon sslscan python3 python3-pip
	pip3 install shcheck --break-system-packages
}

# Passive Info
Passive_Info () {
	printf "$BYellow==================================================================================\n"
	printf "				IP &  Hostname					  	\n"
	printf "==================================================================================$NC\n"
	host $Domain >> IP_n_Hostname
	cat IP_n_Hostname
}

Check_DNS () {
	printf "$BYellow==================================================================================\n"
        printf "                                DNS Records                                          \n"
        printf "==================================================================================$NC\n"
	dnsrecon -d $Domain >> DNS_Entries
	cat DNS_Entries
}


# SSL Certificate Strength
Check_SSL_Certificate () {
	printf "$BYellow==================================================================================\n"
	printf "				SSL Certificate Strength				\n"
	printf "==================================================================================$NC\n"
	sslscan $Website >> SSL_Certificate_Strength
	cat SSL_Certificate_Strength
}


# Security Headers
Check_Security_Headers () {
	printf "$BYellow==================================================================================\n"
	printf "				Missing Security Headers			       	\n"
	printf "==================================================================================$NC\n"
	shcheck.py $Website >> Missing_Security_Headers
	cat Missing_Security_Headers | grep --color "Missing"
}

# Calling the Function
Check_Tools
printf "\n\n\n"
Passive_Info
printf "\n\n\n"
Check_DNS
printf "\n\n\n"
Check_Security_Headers
printf "\n\n\n"
Check_SSL_Certificate
printf "\n\n\n"
printf "$BRed ----------------------------------------------------------------------\n"
printf "$BRed 		All Outputs can be found under $DirectoryName folder!\n"
printf "$BRed ----------------------------------------------------------------------"