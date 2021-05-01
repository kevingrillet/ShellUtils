#!/bin/bash
# ##############################################################################
# Script Name   : utils_maths.sh
# Description   : Common function for shell projects using maths
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# ##############################################################################
[ -n "${UTILS_MATHS}" ] && return; UTILS_MATHS=0; #pragma once

# ##############################################################################
# Function Name : abs
# Args          : <VALUE>
# Output        : stdout
# Source        : https://stackoverflow.com/a/47240327/7295428
# ##############################################################################
abs() {
    if [ "$#" -ne 1 ] ; then echo "Usage: abs <VALUE>" >&2; return 1; fi
    echo $((${1#-})) >&1
}

# ##############################################################################
# Function Name : convertHexToDec
# Args          : <VALUE>
# Output        : stdout
# Source        : https://stackoverflow.com/a/22863296/7295428
# ##############################################################################
convertHexToDec() {
    if [ "$#" -ne 1 ] ; then echo "Usage: convertHexToDec <VALUE>" >&2; return 1; fi
    echo $((0x${1})) >&1
    # echo $((16#value)) >&1
}

# ##############################################################################
# Function Name : pow
# Args          : <BASE> <EXPONENT>
# Output        : stdout
# Source        : https://stackoverflow.com/a/22863296/7295428
# ##############################################################################
pow() {
    if [ "$#" -ne 2 ] ; then echo "Usage: pow <BASE> <EXPONENT>" >&2; return 1; fi
    echo $(($1**$2)) >&1
}

# ##############################################################################
# Function Name : randomInt
# Output        : stdout
# Source        : https://blog.eduonix.com/shell-scripting/generating-random-numbers-in-linux-shell-scripting/
# ##############################################################################
randomInt() {
    rand=$$
    echo $((rand)) >&1
}

# ##############################################################################
# Function Name : randomIntRange
# Args          : <LOWER> <UPPER>
# Output        : stdout
# Source        : https://blog.eduonix.com/shell-scripting/generating-random-numbers-in-linux-shell-scripting/
# ##############################################################################
randomIntRange() {
    if [ "$#" -ne 2 ] ; then echo "Usage: randomIntRange <LOWER> <UPPER>" >&2; return 1; fi
    rand=$$
    diff=$(($2 - $1 + 1))
    echo $((rand%diff + $1)) >&1
}

# ##############################################################################
# Function Name : sqrt
# Args          : <VALUE>
# Output        : stdout
# Source        : https://stackoverflow.com/a/59263103/7295428
# ##############################################################################
sqrt() {
    if [ "$#" -ne 1 ] ; then echo "Usage: sqrt <VALUE>" >&2; return 1; fi
    divider=0
    while true; do
        divider=$((divider + 1))
        sqrt=$(($1 / divider))
        if [ $divider -eq $sqrt ] || [ $divider -gt $sqrt ]; then break; fi
    done
    echo $sqrt >&1
}

# ##############################################################################
# Function Name : toPercent
# Args          : <VALUE> <MAX>
# Output        : stdout
# ##############################################################################
toPercent() {
    if [ "$#" -ne 2 ] ; then echo "Usage: toPercent <VALUE> <MAX>" >&2; return 1; fi
    echo $(($1 * 100 / $2)) >&1
}
