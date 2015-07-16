#!/bin/sh

if test ! $(which go)
then
  echo "  Installing go for you."
  brew install go > /tmp/go-install.log
fi

go get code.google.com/p/go.tools/cmd/cover
