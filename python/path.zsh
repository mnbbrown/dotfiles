#!/usr/bin/bash

if [ -d "$HOME/.pyenv" ]; then
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PATH:$PYENV_ROOT/bin"

  if which pyenv > /dev/null; then
      eval "$(pyenv init - --path --no-rehash)" # this only sets up the path stuff
      alias pyenv='nocorrect pyenv'
  fi
  if which pyenv > /dev/null; then
      eval "$(pyenv virtualenv-init - zsh)"

      if [[ -n $ZSH_VERSION ]]; then
        autoload -Uz add-zsh-hook
        add-zsh-hook -D precmd _pyenv_virtualenv_hook
      fi
  fi
fi


if [ -d "$HOME/Library/Python/3.9/bin" ]; then
  export PATH="/Users/mbrown/Library/Python/3.9/bin:$PATH"
fi
