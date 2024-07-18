#!/bin/bash

### Packages
apt update
apt install -y vim less

### Nginx

# Fazer manualmente
# Colocar isso em nginx.conf
# include /etc/nginx/sites-enabled/*;
sed -i '/include \/etc\/nginx\/conf/a \ \ \ \ include /etc/nginx/sites-enabled/*;' /etc/nginx/nginx.conf

# Pastas
cd /etc/nginx
mkdir sites-availabled && mkdir sites-enabled
cp /docker-util/site.conf sites-availabled
mv conf.d/default.conf sites-availabled
cd sites-enabled
ln -s ../sites-availabled/site.conf site.conf
/etc/init.d/nginx restart

