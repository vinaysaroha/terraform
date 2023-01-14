#!/bin/bash
sudo yum udpate -y 
sudo yum install httpd  -y
sudo echo $(hostname) > /var/www/html/index.html
sudo chmod 777 -R /var/www/html
sudo mkdir /var/www/html/app
sudo echo "app folder ----------->  $(hostname)" > /var/www/html/app/index.html
sudo systemctl start httpd
sudo systemctl enable httpd 
