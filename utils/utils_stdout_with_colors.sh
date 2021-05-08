#!/bin/bash
# ##############################################################################
# Script Name   : utils_stdout_with_colors.sh
# Description   : Common print functions for shell projects
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# Require       : utils_stdout_colors.sh
# ##############################################################################
[ -n "${UTILS_STDOUT_WITH_COLORS}" ] && return; UTILS_STDOUT_WITH_COLORS=0; #pragma once

# ##############################################################################
# Function Name : printDebug
# Description   : Print debug message
# Args          : <MESSAGE>
# Output        : stdout [DEBUG] <MESSAGE>
# ##############################################################################
printDebug() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printDebug <MESSAGE>" >&2; return 1; fi
    echo -e "${On_Blue}[DEBUG]\t\t$1${Color_Off}" >&1
}

# ##############################################################################
# Function Name : printError
# Description   : Print error message
# Args          : <MESSAGE>
# Output        : stderr [ERROR] <MESSAGE>
# ##############################################################################
printError() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printError <MESSAGE>" >&2; return 1; fi
    echo -e "${Red}[ERROR]${Color_Off}\t\t$1" >&2
}

# ##############################################################################
# Function Name : printInfo
# Description   : Print info message
# Args          : <MESSAGE>
# Output        : stdout [INFORMATION] <MESSAGE>
# ##############################################################################
printInfo() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printInfo <MESSAGE>" >&2; return 1; fi
    echo -e "${Cyan}[INFORMATION]${Color_Off}\t$1" >&1
}

# ##############################################################################
# Function Name : printSuccess
# Description   : Print success message
# Args          : <MESSAGE>
# Output        : stdout [SUCCESS] <MESSAGE>
# ##############################################################################
printSuccess() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printSuccess <MESSAGE>" >&2; return 1; fi
    echo -e "${Green}[SUCCESS]${Color_Off}\t$1" >&1
}

# ##############################################################################
# Function Name : printTask
# Description   : Print task message
# Args          : <MESSAGE>
# Output        : stdout [TASK] <MESSAGE>
# ##############################################################################
printTask() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printTask <MESSAGE>" >&2; return 1; fi
    echo -e "${Blue}[TASK]${Color_Off}\t\t$1" >&1
}

# ##############################################################################
# Function Name : printTip
# Description   : Print tip message
# Args          : <MESSAGE>
# Output        : stdout [TIP] <MESSAGE>
# ##############################################################################
printTip() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printTip <MESSAGE>" >&2; return 1; fi
    echo -e "${Purple}[TIP]${Color_Off}\t\t$1" >&1
}

# ##############################################################################
# Function Name : printWarn
# Description   : Print warning message
# Args          : <MESSAGE>
# Output        : stderr [WARN] <MESSAGE>
# ##############################################################################
printWarn() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printWarn <MESSAGE>" >&2; return 1; fi
    echo -e "${Yellow}[WARNING]${Color_Off}\t$1" >&2
}
