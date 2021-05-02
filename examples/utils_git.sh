#!/bin/bash
# ##############################################################################
# Script Name   : utils_git.sh
# Description   : Demo of utils_git.sh
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# Require       : utils_git.sh
# ##############################################################################
. ../utils/utils_git.sh

get_latest_release

get_latest_version
get_latest_version kevingrillet/ShellUtils main examples/version.ini # output: 1.0

echo ""
