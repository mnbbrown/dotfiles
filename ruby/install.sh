#!/bin/bash

set -ex

if [ ! command -v rbenv &> /dev/null ]; then
  if [ "$(uname -s)" == "Darwin" ]; then
    "Run brew bundle before running ./install.sh"
    exit
  elif [ "$(uname -s)" == "Linux" ]; then
    sudo apt install rbenv
  fi
fi

# Setup rbenv root.
RBENV_ROOT="$HOME/.rbenv"
mkdir -p $RBENV_ROOT/plugins

# Install rbenv build
if [ ! -d "$RBENV_ROOT/plugins/ruby-build" ]; then
  git clone https://github.com/rbenv/ruby-build.git $RBENV_ROOT/plugins/ruby-build
fi

# Install rbenv default gems
if [ ! -d "$RBENV_ROOT/plugins/rbenv-default-gems" ]; then
  git clone https://github.com/sstephenson/rbenv-default-gems.git $RBENV_ROOT/plugins/rbenv-default-gems
  echo bundler >> ~/.rbenv/default-gems
  echo rubygems-bundler >> ~/.rbenv/default-gems
fi

# Install gemsets
if [ ! -d "$RBENV_ROOT/plugins/rbenv-gemset" ]; then
  git clone git://github.com/jf/rbenv-gemset.git $RBENV_ROOT/plugins/rbenv-gemset
fi

rbenv rehash
