#! /bin/bash

#Upgrade
apt-get update
apt-get upgrade -y

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
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDhuPQbtElqk2bOEUbK1bh/cCjowezw9kaJHjOoxtZ2qcf0p8Jxv7sVaOW5WEffkDjGnLfQ2gGVtCF7Vck0zjaNCYdbyHG0mmejXBhCVpWaHVhv1Zrv1yVrDJNpF2KkK0IuX3w2dhExRQktqi+ER3zRhCTW0npw4HoTt+Eyw/9vdmkIPrfs+TacPv4DmDvmnV+kyOyEi+Aan0MVwpltq7LjydmpND0xKrjZ10LD8Pn8RKJjp0xtQCeVDhYvtB0JHT49t27YTXQWkvyYArEbs45bD3y9MByEBUCDjsSHe6y5PZFHmCWHNEBsXJDH4CrPU9Tph3ikCG3ZYHFFepXM6oitUazshRFB3MBXzFYTP6xzdKbvhw3TEHI1t9n1fbXV0vEOoZxcPFnahYXaswCUBg6uru7ebdukZnkI/u7oNBofp8nVHWM8SiLc+KZ0nMZncinG00wNDanr0JR32kl43EgrkEg2pJzi37T1twZXvS75vmWLClM3yx7kCCdGYHdyUdyM7Ebsg3APWqwKMBTXEtclnCx27NekTMy6bzZonXhqyM0zwRmoy0SwOIcffKTmh8+HYQ0TqTFGuBh2E0W0m8VCucyiEDKxgAaiFaa+IsE+0kUPnXCvCPAdpIbeEfvtnMnpbUIBO5vqzXc0od18Y/+Vu1HsiVLdkmMY317FmSp5qQ== mfischler@mfischlers-MacBook-Pro.local" > /home/$USER/.ssh/authorized_keys
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

#Additional Programs
apt-get install htop -y
apt-get install dig -y
apt-get install nmap -y
apt-get install nmon -y

#All Done
echo All Good