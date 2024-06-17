#!/bin/sh
cp /home/italo_ferreira/caqui/home-page-master-2024-06-10.tar.gz /var/www/home-page/public_html/
cd /var/www/home-page/public_html/
tar -xvzf home-page-master-2024-06-10.tar.gz
mv -f home-page/* .
rm -rf home-page home-page-master-2024-06-10.tar.gz 
service nginx restart
echo "
#############################
Tudo executado!
Agora obtenha o certificado ssl
$ sudo certbot --nginx
#############################