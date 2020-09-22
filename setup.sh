#! /bin/bash

#Upgrade
apt-get update
apt-get upgrade -y

#Additional Programs
apt-get install htop dig nmap nmon curl -y

#Set Hostname
read -p "Hostname: " HOSTNAME
hostnamectl set-hostname $HOSTNAME
nano /etc/hosts
IP=$(curl -s -4 icanhazip.com)
echo "$IP   $HOSTNAME" >> /etc/hosts

#Add User
read -p "Enter Username:" USER
adduser $USER
adduser $USER sudo

#SSH Config
mkdir /home/$USER/.ssh
touch /home/$USER/.ssh/authorized_keys
chmod 700 /home/$USER/.ssh
chmod 600 /home/$USER/.ssh/authorized_keys
chown ${USER}:${USER} /home/${USER}/.ssh/authorized_keys
chown ${USER}:${USER} /home/${USER}/.ssh

#sshd_config File
sed -i -e "s/PermitRootLogin yes/PermitRootLogin no/" /etc/ssh/sshd_config
sed -i -e "s/#PermitRootLogin no/PermitRootLogin no/" /etc/ssh/sshd_config
sed -i -e "s/PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
sed -i -e "s/#PasswordAuthentication no/PasswordAuthentication no/" /etc/ssh/sshd_config
systemctl restart sshd

#Set Date
dpkg-reconfigure tzdata
date

#All Done
echo All Good
