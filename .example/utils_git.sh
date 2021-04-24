#!/bin/bash
# .example/utils_git.sh
# https://www.shellcheck.net/
source ../utils_git.sh

get_latest_release

get_latest_version
get_latest_version kevingrillet/ShellUtils main \.example/version.ini

echo ""
