#!/bin/bash -i

##
#Bash menu script

function list_files(){
	echo ""

	echo "$(ls -l) "
	echo ""

}

function free_disk(){

 	echo "$(df -H)"
}

function Current_Directory(){


	export PATH=$PATH:$HOME/bin
	echo "$PATH"
}
function com_history(){
	HISTFILE=~/.bash_history
	set -o history
	history | tail
	echo""
}
function backup(){
	echo "Enter the folder or file to be backed up"
	read BACKUPDIR
	echo $BACKUPDIR
	 mkdir BackupFolder
	 echo "Backing up files from $BACKUPDIR...."
	  cp -R $BACKUPDIR BackupFolder/$BACKUPDIR
	echo "Backup Completed"
	echo""
}
function quit(){
	echo "Thank you for using the program"
	exit 0
}

Red='\e[31m'
blue='\e[34m'
clear='\e[0m'

ColorRed(){
	echo -ne $red$1$clear
}

ColorBlue(){
	echo -ne $blue$1$clear
}


menu(){
echo -ne "
$(ColorRed)				*BASH COMMANDS*
$(ColorRed '1)') List files
$(ColorRed '2)') Free disk space
$(ColorRed '3)') Current Directory
$(ColorRed '4)') History
$(ColorRed '5)') Backup Files
$(ColorRed '6)') Exit
$(ColorBlue 'Choose an option: ')"

	read a
	case $a in
		1)list_files ; menu;;
		2)free_disk ; menu;;
		3)Current_Directory ; menu;;
		4)com_history ; menu;;
		5)backup ; menu;;
		6)quit ; menu;;
		*)echo -e $red"Wrong option."$clear;
		esac
}

menu
