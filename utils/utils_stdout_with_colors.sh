#!/bin/bash
# ./utils/utils_stdout_with_colors.sh
# https://www.shellcheck.net/
[ -n "${UTILS_STDOUT_WITH_COLORS}" ] && return; UTILS_STDOUT_WITH_COLORS=0; #pragma once

# printDebug <MESSAGE>
printDebug() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printDebug <MESSAGE>" >&2; return 1; fi
    echo -e "${On_Blue}[DEBUG] $1${Color_Off} "
}

# printError <MESSAGE>
printError() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printError <MESSAGE>" >&2; return 1; fi
    echo -e "${Red}[ERROR]${Color_Off} $1"
}

# printInfo <MESSAGE>
printInfo() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printInfo <MESSAGE>" >&2; return 1; fi
    echo -e "${Cyan}[INFORMATION]]${Color_Off} $1"
}

# printSuccess <MESSAGE>
printSuccess() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printSuccess <MESSAGE>" >&2; return 1; fi
    echo -e "${Green}[SUCCESS]${Color_Off} $1"
}

# printTask <MESSAGE>
printTask() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printTask <MESSAGE>" >&2; return 1; fi
    echo -e "${Blue}[TASK]${Color_Off} $1"
}

# printTip <MESSAGE>
printTip() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printTip <MESSAGE>" >&2; return 1; fi
    echo -e "${Purple}[TIP]${Color_Off} $1"
}

# printWarn <MESSAGE>
printWarn() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printWarn <MESSAGE>" >&2; return 1; fi
    echo -e "${Yellow}[WARNING]${Color_Off} $1"
}
