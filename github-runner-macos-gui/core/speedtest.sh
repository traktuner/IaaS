#!/bin/bash -e -o pipefail
source ./utils/utils.sh
 
echo "Installing Ookla Speedtest..."
brew_smart_install "speedtest-cli"