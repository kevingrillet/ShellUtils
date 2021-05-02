#!/bin/bash
# ##############################################################################
# Script Name   : exp_bash.sh
# Description   : Experiment around Bash
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# ##############################################################################

bash --version                                  # Check bash version
if command -v vi &> /dev/null; then             # Check if vi exists
    vi -es +"bufdo wq" ../*/*.sh                # Adds EOL at EOF on file save if it's missing.
fi
if command -v dos2unix &> /dev/null; then       # Check if dos2unix exists
    dos2unix ../*/*.sh                          # Reformat all .sh files: CR + LF => LF
fi
chmod -v +x ../*/*.sh                           # chmod +x all .sh files
