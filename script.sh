#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
yum install http* -y

# make sure nginx is started
systemctl start httpd
systemctl enable httpd