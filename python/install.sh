#!/bin/sh
set -v

echo "  Installing python for you."
if [ "$(uname -s)" == "Darwin" ]; then
  brew install python --with-brewed-openssl 2>&1 | tee /tmp/python-install.log
  brew install pyenv --with-brewed-openssl 2>&1 | tee /tmp/python-install.log
  brew install pyenv-virtualenv --with-brewed-openssl 2>&1 | tee /tmp/python-install.log
  brew install python3 --with-brewed-openssl 2>&1 | tee /tmp/python3-install.log
fi

if [ "$(uname -s)" == "Linux" ]; then
  sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
fi
