#!/bin/bash

# Para Guest additions and default
apt install --no-install-recommends wget gpg bzip2 tar build-essential dkms linux-headers-$(uname -r)

# Para Mate
apt install --no-install-recommends xorg mate-core sudo less vim bash-completion git

# Chrome
curl -sS https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/chrome.gpg
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && apt-get update
apt-get -y install google-chrome-stable

# VSCode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
apt install apt-transport-https
apt update
apt install code # or code-insiders

# Para finalizar
apt install -f
apt autoremove