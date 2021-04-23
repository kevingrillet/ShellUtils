#!/bin/bash
# https://www.shellcheck.net/

# get_latest_release <USER/REPO>
# https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
get_latest_release() {
    curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
        grep '"tag_name":' |                                            # Get tag line
        sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

# get_latest_version <USER/REPO> <BRANCH> <FOLDER/FILE>
function get_latest_version() {
    curl --silent "https://raw.githubusercontent.com/$1/$2/$3"
}
# get_latest_version kevingrillet/ShellUtils main \.example/version.ini
