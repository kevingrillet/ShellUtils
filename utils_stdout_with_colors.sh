#!/bin/bash
# utils_stdout_with_colors.sh
# https://www.shellcheck.net/
[ -n "${UTILS_STDOUT_WITH_COLORS}" ] && return; UTILS_STDOUT_WITH_COLORS=0; #pragma once

# printDebug <MESSAGE>
function printDebug() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printDebug <MESSAGE>" >&2; return 1; fi
    echo -e "${On_Blue}[DEBUG] $1${Color_Off} "
}

# printError <MESSAGE>
function printError() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printError <MESSAGE>" >&2; return 1; fi
    echo -e "${Red}[ERROR]${Color_Off} $1"
}

# printInfo <MESSAGE>
function printInfo() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printInfo <MESSAGE>" >&2; return 1; fi
    echo -e "${Cyan}[INFORMATION]]${Color_Off} $1"
}

# printSuccess <MESSAGE>
function printSuccess() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printSuccess <MESSAGE>" >&2; return 1; fi
    echo -e "${Green}[SUCCESS]${Color_Off} $1"
}

# printTask <MESSAGE>
function printTask() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printTask <MESSAGE>" >&2; return 1; fi
    echo -e "${Blue}[TASK]${Color_Off} $1"
}

# printTip <MESSAGE>
function printTip() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printTip <MESSAGE>" >&2; return 1; fi
    echo -e "${Purple}[TIP]${Color_Off} $1"
}

# printWarn <MESSAGE>
function printWarn() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printWarn <MESSAGE>" >&2; return 1; fi
    echo -e "${Yellow}[WARNING]${Color_Off} $1"
}
