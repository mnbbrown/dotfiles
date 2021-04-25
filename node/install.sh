#!/bin/sh
set -e

echo "  Installing node for you."
mkdir -p ~/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm install node
npm install -g yarn 2>&1 | tee /tmp/node-install.log
