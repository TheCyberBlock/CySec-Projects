AutoRecon Script
===========

Script to automatically discover open ports and run detailed Nmap scans on those specific ports


Description
-------------
This script is not a finished tool. I am still working on it to make it fully automated and also add new stuff. That being said usually when we do nmap scans on websites or IPs, we have to first discover how many ports are open. We have to scan all 65,535 ports. This script makes it easy to discover all the open ports and then run various scripts on only those open ports minimising the traffic captured. 


Usage
-------------
- Open a terminal, type `git clone https://github.com/TheCyberBlock/CySec-Projects.git` and press enter
- Go to `AutoRecon` folder by typing `cd AutoRecon`
- Type `chmod +x AutoRecon.sh` in terminal
- Run the script with `./AutoRecon.sh <IP>` replace the `<IP>` with IP you want to scan


Requirements
-------------
- Linux OS (Debian Based)
- Nmap ( type `sudo apt install nmap` to install Nmap )
- Git