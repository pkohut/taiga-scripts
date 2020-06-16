#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

source ~/.bashrc

nvm install 10.21.0

sudo npm install -g gulp

pushd ~/taiga-front

npm install

popd

# gulp

