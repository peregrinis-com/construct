FROM nginx:latest

### Packages
RUN apt update && apt install -y vim less

# Colocar a linha abaixo no nginx.conf
# include /etc/nginx/sites-enabled/*;
RUN sed -i '/include \/etc\/nginx\/conf/a \ \ \ \ include /etc/nginx/sites-enabled/*;' /etc/nginx/nginx.conf

# Pastas e vhosts
RUN mkdir /etc/nginx/sites-available && mkdir /etc/nginx/sites-enabled
RUN echo "server {"                                     > /etc/nginx/sites-available/site.conf
RUN echo "    index index.html index.php;"              >> /etc/nginx/sites-available/site.conf
RUN echo "    server_name docker.localhost;"            >> /etc/nginx/sites-available/site.conf
RUN echo "    error_log /var/log/nginx/error.log;"      >> /etc/nginx/sites-available/site.conf
RUN echo "    access_log /var/log/nginx/access.log;"    >> /etc/nginx/sites-available/site.conf
RUN echo "    root /www;"                               >> /etc/nginx/sites-available/site.conf
RUN echo "    location ~ \.php$ {"                      >> /etc/nginx/sites-available/site.conf
RUN echo "        #try_files $uri =404;"                >> /etc/nginx/sites-available/site.conf
RUN echo "        fastcgi_split_path_info ^(.+\.php)(/.+)\$;"                           >> /etc/nginx/sites-available/site.conf
RUN echo "        fastcgi_pass php:9000;"                                               >> /etc/nginx/sites-available/site.conf
RUN echo "        fastcgi_index index.php;"                                             >> /etc/nginx/sites-available/site.conf
RUN echo "        include fastcgi_params;"                                              >> /etc/nginx/sites-available/site.conf
RUN echo "        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;"  >> /etc/nginx/sites-available/site.conf
RUN echo "        fastcgi_param PATH_INFO \$fastcgi_path_info;"                         >> /etc/nginx/sites-available/site.conf
RUN echo "    }"                                                                        >> /etc/nginx/sites-available/site.conf
RUN echo "}"                                                                            >> /etc/nginx/sites-available/site.conf
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf