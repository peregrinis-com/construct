#!/bin/bash

# Para Guest Additions
apt install --no-install-recommends bzip2 tar build-essential dkms linux-headers-$(uname -r)

# Para Mate
apt install --no-install-recommends xorg mate-core sudo less vim bash-completion git

# Para finalizar
apt install -f
apt autoremove