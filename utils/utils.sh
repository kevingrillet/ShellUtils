#!/bin/bash
# ##############################################################################
# Script Name   : utils.sh
# Description   : Common function for shell projects
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# ##############################################################################
[ -n "${UTILS}" ] && return; UTILS=0; #pragma once

# Variables
DEBUG=0
VERBOSE=0

# ##############################################################################
# Function Name : execDebug
# Description   : Execute <COMMAND> if $DEBUG >= 1
# Args          : <COMMAND>
# ##############################################################################
execDebug() {
    if [ "$#" -le 1 ] ; then echo "Usage: execDebug <COMMAND>" >&2; return 1; fi
    if [ $DEBUG -ge 1 ]; then
        "$@"
    fi
}

# ##############################################################################
# Function Name : execVerbose
# Description   : Show <COMMAND> stdout & stderr if $VERBOSE >= 1
# Args          : <COMMAND>
# ##############################################################################
execVerbose() {
    if [ "$#" -le 1 ] ; then echo "Usage: execVerbose <COMMAND>" >&2; return 1; fi
    if [ $VERBOSE -ge 1 ]; then
        "$@"
    else
        "$@" &>/dev/null
    fi
}

# ##############################################################################
# Function Name : pause
# Description   : Pause the script, wait an input from the user
# ##############################################################################
pause() {
    read -s -r -n 1 -p "Press any key to continue..." >&1
    echo "" >&1
}

# ##############################################################################
# Function Name : printVerbose
# Description   : Show <MESSAGE> on stdout if $VERBOSE >= 1
# Args          : <MESSAGE>
# Output        : stdout <MESSAGE>
# ##############################################################################
printVerbose() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printVerbose <MESSAGE>" >&2; return 1; fi
    if [ $VERBOSE -ge 1 ]; then
        echo -e "$1" >&1
    fi
}
