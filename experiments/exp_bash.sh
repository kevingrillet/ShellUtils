#!/bin/bash
# ##############################################################################
# Script Name   : exp_bash.sh
# Description   : Experiment around Bash
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# ##############################################################################

case "$(uname -s)" in                           # Check OS
    Darwin)
        echo 'Mac OS X'
        ;;
    Linux)
        echo 'Linux'
        ;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*)
        echo 'MS Windows'
        ;;
    *)
        echo 'Other OS'
        ;;
esac

bash --version                                  # Check bash version

if command -v vi &> /dev/null; then             # Check if vi exists
    vi -es +"bufdo wq" ../*/*.sh                # Adds EOL at EOF on file save if it's missing.
fi

if command -v dos2unix &> /dev/null; then       # Check if dos2unix exists (windows)
    dos2unix ../*/*.sh                          # Reformat all .sh files: CR + LF => LF
elif command -v tr &> /dev/null; then           # Check if te exists (mac)
    for f in ../*/*.sh; do
        tr -d '\r' < "$f" > "$(basename "$f" .sh)"-out.sh
        mv "$(basename "$f" .sh)"-out.sh "$f"
    done
fi

chmod -v +x ../*/*.sh                           # chmod +x all .sh files
