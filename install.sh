#!/usr/bin/env bash
#
# Run all dotfiles installers.

set -e

# find the installers and run them iteratively
find . -name install.sh | while read installer ; do sh -c "${installer}" ; done
