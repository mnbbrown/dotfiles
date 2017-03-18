#!/bin/sh
set -v

echo "  Installing node for you."
brew install node 2>&1 | tee /tmp/node-install.log
npm install -g yarn 2>&1 | tee /tmp/node-install.log
