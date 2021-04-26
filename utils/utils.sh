#!/bin/bash
# ./utils/utils.sh
# https://www.shellcheck.net/
[ -n "${UTILS}" ] && return; UTILS=0; #pragma once

DEBUG=0
VERBOSE=0

# execDebug <COMMAND>
# exec if DEBUG >= 1
execDebug() {
    if [ "$#" -le 1 ] ; then echo "Usage: execDebug <COMMAND>" >&2; return 1; fi
    if [ $DEBUG -ge 1 ]; then
        "$@"
    fi
}

# execVerbose <COMMAND>
# hide the output if VERBOSE >= 1
execVerbose() {
    if [ "$#" -le 1 ] ; then echo "Usage: execVerbose <COMMAND>" >&2; return 1; fi
    if [ $VERBOSE -ge 1 ]; then
        "$@"
    else
        "$@" &>/dev/null
    fi
}

# pause
pause() {
    read -s -r -n 1 -p "Press any key to continue..."
    echo ""
}

# printVerbose <MESSAGE>
# print if verbose >= 1
printVerbose() {
    if [ "$#" -ne 1 ] ; then echo "Usage: printVerbose <MESSAGE>" >&2; return 1; fi
    if [ $VERBOSE -ge 1 ]; then
        echo -e "$1"
    fi
}
