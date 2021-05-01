#!/bin/bash
# ##############################################################################
# Script Name   : utils_git.sh
# Description   : Common function for shell projects using GitHub
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# ##############################################################################
[ -n "${UTILS_GIT}" ] && return; UTILS_GIT=0; #pragma once

# ##############################################################################
# Function Name : get_latest_release
# Description   : Show version of the last release
# Args          : <USER/REPO>
# Output        : stdout last release version
# Source        : https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
# ##############################################################################
get_latest_release() {
    if [ "$#" -ne 1 ] ; then echo "Usage: get_latest_release <USER/REPO>" >&2; return 1; fi
    curl --silent "https://api.github.com/repos/$1/releases/latest" |           # Get latest release from GitHub api
        grep '"tag_name":' |                                                    # Get tag line
        sed -E 's/.*"([^"]+)".*/\1/'                                            # Pluck JSON value
}

# ##############################################################################
# Function Name : get_latest_version
# Description   : Show content of a file (version)
# Args          : <USER/REPO> <BRANCH> <FOLDER/FILE>
# Output        : stdout content of file on GitHub
# ##############################################################################
get_latest_version() {
    if [ "$#" -ne 3 ] ; then echo "Usage: get_latest_version <USER/REPO> <BRANCH> <FOLDER/FILE>" >&2; return 1; fi
    curl --silent "https://raw.githubusercontent.com/$1/$2/$3"
}
