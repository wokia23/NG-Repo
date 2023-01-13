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
sudo yum update -y 
echo "Update complete"
#This part of the script will install awscl2 for this server
sudo yum install awscli-2.noarch -y
echo "awscli-2 has succesfully been installed in your server"
#This part of the script will install wget
sudo yum install wget -y 
echo "wget has succesfully been installed in your server"
#This part of the script will install docker
sudo yum install docker.x86_64 -y 
echo "Docker has succesfully been installed in your server"
#This part of the script will install python3
sudo yum -y groupinstall "Development Tools"
sudo yum -y install gcc devel libffi-devel openssl11 openssl11-devel
cd /opt
sudo wget https://www.python.org/ftp/python/3.10.2/Python-3.10.2.tgz
sudo tar xzf Python-3.10.2.tgz 
cd Python-3.10.2
sudo ./configure
sudo make
sudo make altinstall
echo "Python3 installation complete"
echo "You are now set for work. Thank you for choosing BK tech"