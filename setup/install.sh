#!/bin/bash

sudo cp selinux_config /etc/selinux/config

sudo useradd todoapp

sudo dnf install -y git
git clone https://github.com/nathankazuki/ACIT4640lab2.git

curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo dnf install -y nodejs

sudo dnf install -y mongodb-org
sudo systemctl start mongod
npm install

sudo -i
mv /home/admin/setup/todoapp.service /etc/systemd/system
systemctl daemon-reload
systemctl enable todoapp
systemctl start todoapp

dnf install -y epel-release
dnf install -y nginx

systemctl enable nginx
systemctl start nginx

firewall-cmd --zone=public --add-service=http
firewall-cmd --runtime-to-permanent

node server.js
