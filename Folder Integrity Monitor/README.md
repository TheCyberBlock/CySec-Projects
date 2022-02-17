Folder Integrity Monitor
===========

Few scripts to create a secure hash of any folder and also compare it with later hash to check if changes have been made to system


Description
-------------
- I am still working on these scripts to make them better! 
- There are 2 scripts provided. 
- `CreateHash.sh` helps you create secure hash of any folder you know is critical or a hacker can change. 
- `CheckingIntegrity.sh` helps you create a temporary hash of a folder and comapare it to the secure hash you created earlier. It will spit out any difference in that folder made after you created your secure hash. 
- The whole point of these scripts is to maintain integrity of critical or personal folders
- Create a secure hash of a folder and store it somewhere safe, possibly off that system
- Periodically check the integrity of that folder to make sure it is not tempered with


Usage
-------------
- Open a terminal, type `git clone https://github.com/TheCyberBlock/CySec-Projects.git` and press enter
- Go to `Folder Integrity Monitor` folder by typing `cd "Folder Integrity Monitor"`
- Type `chmod +x *.sh` in terminal
- Move dtreetrawl to path using `sudo mv dtreetrawl /usr/bin/`
- Type `./CreateHash <Path Of Folder> <Secure Hash Storage File>` to create secure hash
- Type `./CheckIntegrity <Path Of Folder> <Secure Hash Storage File>` to compare hash of the folder to secure hash taken earlier


Requirements
-------------
- Linux OS
- dtreetrawl ( provided with code )