#!/bin/bash

# Como usuário comum.
# $ <command>

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install 20
source ~/.bashrc 
nvm install 20
node -v
npm -v

# Usage
# https://medium.com/@shubhamnagar234/create-react-app-hello-world-cb501aa9d9f1
# $ npx create-react-app hello1
# $ cd hello1/
# $ npm start