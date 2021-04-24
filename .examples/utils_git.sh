#!/bin/bash
# ./.examples/utils_git.sh
# https://www.shellcheck.net/
source ../utils/utils_git.sh

get_latest_release

get_latest_version
get_latest_version kevingrillet/ShellUtils main \.examples/version.ini

echo ""
