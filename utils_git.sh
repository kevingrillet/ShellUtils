#!/bin/bash
# utils_git.sh
# https://www.shellcheck.net/
[ -n "${UTILS_GIT}" ] && return; UTILS_GIT=0; #pragma once

# get_latest_release <USER/REPO>
# https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
get_latest_release() {
    if [ "$#" -ne 1 ] ; then echo "Usage: get_latest_release <USER/REPO>" >&2; return 1; fi
    curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
        grep '"tag_name":' |                                            # Get tag line
        sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

# get_latest_version <USER/REPO> <BRANCH> <FOLDER/FILE>
function get_latest_version() {
    if [ "$#" -ne 3 ] ; then echo "Usage: get_latest_version <USER/REPO> <BRANCH> <FOLDER/FILE>" >&2; return 1; fi
    curl --silent "https://raw.githubusercontent.com/$1/$2/$3"
}
