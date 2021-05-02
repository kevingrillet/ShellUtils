#!/bin/bash
# ##############################################################################
# Script Name   : utils_stdout_with_colors.sh
# Description   : Demo of utils_stdout_with_colors.sh
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# Require       : utils_stdout_colors.sh, utils_stdout_with_colors.sh
# ##############################################################################
. ../utils/utils_stdout_colors.sh
. ../utils/utils_stdout_with_colors.sh

printDebug
printDebug "Lorem ipsum dolor sit amet"

printError
printError "Lorem ipsum dolor sit amet"

printInfo
printInfo "Lorem ipsum dolor sit amet"

printSuccess
printSuccess "Lorem ipsum dolor sit amet"

printTask
printTask "Lorem ipsum dolor sit amet"

printTip
printTip "Lorem ipsum dolor sit amet"

printWarn
printWarn "Lorem ipsum dolor sit amet"
