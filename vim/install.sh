#!/bin/bash
set -v

echo "  Installing neovim for you."
if [ "$(uname -s)" == "Darwin" ]; then
  echo "Install with brew bundle"
elif [ "$(uname -s)" == "Linux" ]; then
  sudo apt install neovim
fi
