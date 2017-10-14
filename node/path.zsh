test "$(uname)" = "Darwin" && export PATH="$(brew --prefix node)/bin:$PATH"
test "$(uname)" = "Linux" && export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
