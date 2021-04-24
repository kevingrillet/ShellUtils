#!/bin/bash
# ./utils/utils.sh
# https://www.shellcheck.net/
[ -n "${UTILS}" ] && return; UTILS=0; #pragma once

DEBUG=true
VERBOSE=false

# execDebug <COMMAND>
# exec if DEBUG=true
function execDebug() {
    if [ "$#" -le 1 ] ; then echo "Usage: execDebug <COMMAND>" >&2; return 1; fi
    if [ $DEBUG = true ]; then
        "$@"
    fi
}

# execVerbose <COMMAND>
# hide the output if VERBOSE=false
function execVerbose() {
    if [ "$#" -le 1 ] ; then echo "Usage: execVerbose <COMMAND>" >&2; return 1; fi
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
    if [ "$#" -ne 1 ] ; then echo "Usage: printVerbose <MESSAGE>" >&2; return 1; fi
    if [ $VERBOSE = true ]; then
        echo -e "$1"
    fi
}
