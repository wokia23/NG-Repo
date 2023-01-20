#!/bin/bash
username1=brigthain
username2=emmanuel
username3=joshua
echo "Please enter your username"
read username
if [ $username == $username1 ] || [ $username == $username2 ] || [ $username == $username3 ]
then 
echo "A new user will be created in the system"
else
echo "Sorry you have entered the wrong username"
fi
# The user is created here based on the user who has logged in
if [ $username == $username1 ] || [ $username == $username2 ] || [ $username == $username3 ]
then
sudo adduser "$username"
else
echo "The wrong username has been entered please try again"
fi
echo "Please enter a unique password for your user"
read -s password
echo "password" | sudo passwd "$username" --stdin
echo "$username  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$username
#This part of the script will update all your packages
if [ -f /etc/system-release ]
then
    if cat /etc/system-release|grep -i 'Amazon Linux release 2' 
    then
         sudo yum update -y
         sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
         sudo yum install -y ansible
         sudo yum -y install unzip
         #This part of the script will install awscl2 for this server
         curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        unzip awscliv2.zip
        sudo ./aws/install
        echo "awscli-2 has succesfully been installed in your server"
        #This part of the script will install wget 
        sudo yum install wget -y 
        echo "wget has succesfully been installed in your server"
        #This command will install tree
        sudo yum install tree -y
        #This part of the script will install docker
        sudo yum install docker -y 
        sudo systemctl enable docker.service
        sudo systemctl start docker.service
        echo "Docker has succesfully been installed in your server"
        # Please store all temporary files that you will not need in this directory
        mkdir -p /tmp/storage/
        chown ec2-user:ec2-user /tmp/storage
        echo "Your temporary directory has been created. This directory will be deleted during the next script run"
        # This command will delete all files in the /tmp/storage directory
        rm -rf /tmp/storage/*
    elif cat /etc/system-release|grep -i 'Amazon Linux release 2022' 
    then
        sudo yum update -y
         sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
         sudo yum install -y ansible
         sudo yum -y install unzip
         #This part of the script will install awscl2 for this server
         curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        unzip awscliv2.zip
        sudo ./aws/install
        echo "awscli-2 has succesfully been installed in your server"
        #This part of the script will install wget 
        sudo yum install wget -y 
        echo "wget has succesfully been installed in your server"
        #This command will install tree
        sudo yum install tree -y
        #This part of the script will install docker
        sudo yum install docker -y 
        sudo systemctl enable docker.service
        sudo systemctl start docker.service
        echo "Docker has succesfully been installed in your server"
        # Please store all temporary files that you will not need in this directory
        mkdir -p /tmp/storage/
        chown ec2-user:ec2-user /tmp/storage
        echo "Your temporary directory has been created. This directory will be deleted during the next script run"
        # This command will delete all files in the /tmp/storage directory
        rm -rf /tmp/storage/*
    elif cat /etc/system-release|grep -i 'Red Hat Enterprise Linux' 
    then
        sudo yum update -y
         sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-
         sudo yum install -y ansible
         sudo yum -y install unzip
         #This part of the script will install awscl2 for this server
         curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "aws
        unzip awscliv2.zip
        sudo ./aws/install
        echo "awscli-2 has succesfully been installed in your server"
        #This part of the script will install wget 
        sudo yum install wget -y 
        echo "wget has succesfully been installed in your server"
       #This command will install tree
        sudo yum install tree -y
        #This part of the script will install docker
        sudo yum install docker -y 
        sudo systemctl enable docker.service
        sudo systemctl start docker.service
        echo "Docker has succesfully been installed in your server"
        # Please store all temporary files that you will not need in this direct
        mkdir -p /tmp/storage/
        chown ec2-user:ec2-user /tmp/storage
        echo "Your temporary directory has been created. This directory will be 
        # This command will delete all files in the /tmp/storage directory
        rm -rf /tmp/storage/*
    else
        echo "There was a problem with the operating system you selected"
    fi
else
    echo "Files does not exist or you have selected the wrong operating system"
fi
