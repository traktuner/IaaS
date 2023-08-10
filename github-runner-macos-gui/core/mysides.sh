#!/bin/bash -e -o pipefail
source ./utils/utils.sh
 
echo "Installing mysides..."
brew tap homebrew/cask
brew install --cask mysides