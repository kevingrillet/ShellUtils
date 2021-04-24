#!/bin/bash
# utils_maths.sh
# https://www.shellcheck.net/
[ -n "${UTILS_MATHS}" ] && return; UTILS_MATHS=0; #pragma once

# abs <VALUE>
function abs() {
    value=$1
    echo $((${value#-}))
}
# abs -1

# pow <BASE> <EXPONENT>
function pow() {
    base=$1
    exponent=$2
    echo $((base**exponent))
}
# pow 10 2

# randomInt
# https://blog.eduonix.com/shell-scripting/generating-random-numbers-in-linux-shell-scripting/
function randomInt() {
    rand=$$
    echo $((rand))
}
# randomInt

# randomIntRange <LOWER> <UPPER>
# https://blog.eduonix.com/shell-scripting/generating-random-numbers-in-linux-shell-scripting/
function randomIntRange() {
    rand=$$
    diff=$(($2 - $1 + 1))
    echo $((rand%diff + $1))
}
# randomIntRange 256 1024

# sqrt <VALUE>
# https://stackoverflow.com/a/59263103/7295428
function sqrt() {
    divider=0
    while true; do
        divider=$((divider + 1))
        sqrt=$(($1 / divider))
        if [[ $divider -eq $sqrt ]] || [[ $divider -gt $sqrt ]]; then break; fi
    done
    echo $sqrt
}
# sqrt 100 # output: 10
