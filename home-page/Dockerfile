FROM debian:latest
RUN apt update && apt install -y git systemctl wget

# Golang Package
WORKDIR /root
RUN wget https://go.dev/dl/go1.22.4.linux-amd64.tar.gz
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz
ENV PATH="$PATH:/usr/local/go/bin"

# Arg
ARG TOKEN_REPO

# Golang Service
RUN echo '[Unit]\n\
Description=goweb\n\n\
[Service]\n\
Type=simple\n\
Restart=always\n\
RestartSec=5s\n\
ExecStart=/opt/home/main\n\n\
[Install]\n\
WantedBy=multi-user.target\n'\
>> /lib/systemd/system/goweb.service

# Source
WORKDIR /opt/home/
RUN git clone https://${TOKEN_REPO}@github.com/peregrinis-com/home-page
RUN mv home-page/* .
RUN rm -rf home-page
RUN go build main.go

# Command
CMD ["/usr/bin/systemctl", "start", "goweb"]

# Help
#https://www.atlantic.net/dedicated-server-hosting/deploying-a-go-web-application-using-nginx-on-ubuntu-22-04/
#https://www.digitalocean.com/community/tutorials/how-to-deploy-a-go-web-application-using-nginx-on-ubuntu-18-04#step-3-setting-up-a-reverse-proxy-with-nginx