#!/bin/sh
set -v

echo "  Installing python for you."
brew install python --with-brewed-openssl 2>&1 | tee /tmp/python-install.log
brew install pyenv --with-brewed-openssl 2>&1 | tee /tmp/python-install.log
brew install pyenv-virtualenv --with-brewed-openssl 2>&1 | tee /tmp/python-install.log
#brew install python3 --with-brewed-openssl 2>&1 | tee /tmp/python3-install.log

#echo "  Installing virtualenv"
#pip install virtualenv virtualenvwrapper 2>&1 | tee /tmp/virtualenvwrapper-install.log
