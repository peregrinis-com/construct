#!/bin/bash

apt update
apt install -y nginx
adduser codespace www-data
chown -R .www-data /workspaces/home-page
chmod -R 775 /workspaces/home-page
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/home-page
echo "server {
    listen   80;
    root /workspaces/home-page;
    index index.html index.htm;        
    server_name www.peregrinis.com;
    }" > /etc/nginx/sites-available/home-page
ln -s /etc/nginx/sites-available/home-page /etc/nginx/sites-enabled/home-page
rm /etc/nginx/sites-enabled/default
service nginx restart