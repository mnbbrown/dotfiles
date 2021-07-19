#!/bin/bash

echo "  Installing python for you."
if [ "$(uname -s)" == "Darwin" ]; then
  echo "Install with brew bundle"
elif [ "$(uname -s)" == "Linux" ]; then
  sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
fi
