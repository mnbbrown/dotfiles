#!/usr/bin/bash

# eval "$(rbenv init -)"
function bera () {
  git diff HEAD --name-only --diff-filter=ACMRTUXB | grep '\.rb$' | grep -v 'spec/nandi/fixtures' | tr '\\\n' ' ' | xargs bundle exec rubocop -A
}
