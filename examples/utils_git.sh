#!/bin/bash
# ./examples/utils_git.sh
. ../utils/utils_git.sh

get_latest_release

get_latest_version
get_latest_version kevingrillet/ShellUtils main examples/version.ini # output: 1.0

echo ""
