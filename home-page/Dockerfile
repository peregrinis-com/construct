FROM nginx:latest
EXPOSE 80

RUN apt update && apt install -y git

# Arg
ARG TOKEN_REPO

# Source
### Modo 1
#RUN mkdir -p /var/www/home-page/public_html
#RUN chown -R www-data:www-data /var/www/home-page/public_html
#WORKDIR /var/www/home-page/public_html
#RUN git clone https://${TOKEN_REPO}@github.com/peregrinis-com/home-page
#RUN mv home-page/* .
#RUN rm -rf home-page
####

# Source
RUN cp -rf /usr/share/nginx/html/index.html /root
WORKDIR /usr/share/nginx/html/
RUN git clone https://${TOKEN_REPO}@github.com/peregrinis-com/home-page
RUN mv home-page/* .
RUN rm -rf home-page

# VHost
#RUN cp /etc/nginx/sites-available/default /etc/nginx/sites-available/home-page
#RUN echo "server {"                                     > /etc/nginx/sites-available/home-page
#RUN echo "    listen   80;"                             >> /etc/nginx/sites-available/home-page
#RUN echo "    root /var/www/home-page/public_html;"     >> /etc/nginx/sites-available/home-page
#RUN echo "    index index.html index.htm;"              >> /etc/nginx/sites-available/home-page
#RUN echo "    server_name www.peregrinis.com;"          >> /etc/nginx/sites-available/home-page
#RUN echo "    }"                                        >> /etc/nginx/sites-available/home-page
#RUN ln -s /etc/nginx/sites-available/home-page /etc/nginx/sites-enabled/home-page
#RUN rm /etc/nginx/sites-enabled/default