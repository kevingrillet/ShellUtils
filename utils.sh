#!/bin/bash
# utils.sh
# https://www.shellcheck.net/
[ -n "${UTILS}" ] && return; UTILS=0; #pragma once

DEBUG=true
VERBOSE=false

# execDebug <COMMAND>
# exec if DEBUG=true
function execDebug() {
    if [ $DEBUG = true ]; then
        "$@"
    fi
}
# source utils_stdout_with_colors.sh; execDebug printWarn "test"

# execVerbose <COMMAND>
# hide the output if VERBOSE=false
function execVerbose() {
    if [ $VERBOSE = true ]; then
        "$@"
    else
        "$@" &>/dev/null
    fi
}

# pause
function pause() {
    read -s -r -n 1 -p "Press any key to continue..."
    echo ""
}

# printVerbose <MESSAGE>
# print if verbose
function printVerbose() {
    if [ $VERBOSE = true ]; then
        echo -e "$1"
    fi
}
