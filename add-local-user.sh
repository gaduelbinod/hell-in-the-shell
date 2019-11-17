#!/bin/bash


#This script creates a new user on the local system
 
#You will be prompted to enter usernam(login), the perosn name, and a password

#Making sure the script is being executed with superuser priviliges

if [[ "${UID}" -ne 0 ]]
then 
    echo 'please run with sudo or as a root'
    exit 1
fi

#Prompting the username from the user

read -p 'enter the user name: ' USERNAME

#prompting the name of the user

read -p 'enter your name: ' COMMENT

#Asking for the password
 
read -p 'enter the password: ' PASSWORD

#Now creating the user
useradd -c "${COMMENT}" -m ${USERNAME}


#Checking is the user is created or not

if [[ "${?}" -ne 0 ]]
then 
   echo 'the user could not be created'
   exit 1
fi


#Now adding the password 

echo ${PASSWORD} | passwd --stdin ${USERNAME}

if [[ "${?}" -ne 0 ]]
then 
echo 'The password for the account could not be set'
exit 1
fi

#Force the password to change for the user
passwd -e ${USERNAME}
echo 'your account is setup successfully'
echo
exit 0
