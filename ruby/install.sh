#!/bin/sh

if test ! $(which rbenv)
then
  echo "  Installing rbenv for you."
  brew install rbenv 2>&1 | tee /tmp/rbenv-install.log
fi

if test ! $(which ruby-build)
then
  echo "  Installing ruby-build for you."
  brew install ruby-build 2>&1 | tee /tmp/ruby-build-install.log
fi

# Setup rbenv root.
RBENV_ROOT="$HOME/.rbenv"
mkdir -p $RBENV_ROOT/plugins

# Install rbenv update
git clone https://github.com/rkh/rbenv-update.git $RBENV_ROOT/plugins/rbenv-update

# Install rbenv default gems
git clone https://github.com/sstephenson/rbenv-default-gems.git $RBENV_ROOT/plugins/rbenv-default-gems
echo bundler >> ~/.rbenv/default-gems
echo rubygems-bundler >> ~/.rbenv/default-gems
