#!/bin/bash
# ##############################################################################
# Script Name   : exp_gitBashInstallPackage.sh
# Description   : Experiment around Git Bash to install packages
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# Idea          : https://superuser.com/questions/701141/how-to-add-more-commands-to-git-bash
# ##############################################################################

if [ "$#" -ne 1 ]; then
    echo "Usage: ./exp_gitBashInstallPackage.sh <PACKAGE>" >&2
    echo "Description: " >&2
    echo "  If not install, check if available on [http://repo.msys2.org/msys/x86_64/]" >&2
    echo "  then download & install" >&2
    return 1
fi

packageName=$1

lookingForPackage() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: lookingForPackage <PACKAGE>" >&2
        return 1
    fi

    curl -s "http://repo.msys2.org/msys/x86_64/" | grep -i "$1" | grep -i ".xz" | tail -n2 | head -n1 | sed -n 's/.*\"\>\([^"]*\)\<\/a\>/\1/p' | tr -s ' ' | cut -d ' ' -f 1
    return 0
}

echo "Working on $packageName."
if which "$packageName" 1>/dev/null; then
    echo "Package found!"
else
    echo "Package not found!"
    found=$(lookingForPackage "$packageName") # Check if package exists in repo
    if [ $? ]; then
        echo "Package found in repo [http://repo.msys2.org/msys/x86_64/] : $found"
        curl -sLO "http://repo.msys2.org/msys/x86_64/$found" # Download
        tar -xf "./$found"                                   # Unzip
        # https://gist.github.com/hisplan/ee54e48f17b92c6609ac16f83073dde6
        cp -r "./usr" "/C/Program Files/Git/" # Copy files in /usr/bin
        rm -rf usr "./$found"                 # Remove temp files
    else
        echo "Package not found in repo [http://repo.msys2.org/msys/x86_64/]"
    fi
fi
