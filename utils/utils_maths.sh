#!/bin/bash
# ./utils/utils_maths.sh
# https://www.shellcheck.net/
[ -n "${UTILS_MATHS}" ] && return; UTILS_MATHS=0; #pragma once

# abs <VALUE>
# https://stackoverflow.com/a/47240327/7295428
abs() {
    if [ "$#" -ne 1 ] ; then echo "Usage: abs <VALUE>" >&2; return 1; fi
    echo $((${1#-}))
}

# convertHexToDec <VALUE>
# https://stackoverflow.com/a/22863296/7295428
convertHexToDec() {
    if [ "$#" -ne 1 ] ; then echo "Usage: convertHexToDec <VALUE>" >&2; return 1; fi
    echo $((0x${1}))
    # echo $((16#value))
}

# pow <BASE> <EXPONENT>
pow() {
    if [ "$#" -ne 2 ] ; then echo "Usage: pow <BASE> <EXPONENT>" >&2; return 1; fi
    echo $(($1**$2))
}

# randomInt
# https://blog.eduonix.com/shell-scripting/generating-random-numbers-in-linux-shell-scripting/
randomInt() {
    rand=$$
    echo $((rand))
}

# randomIntRange <LOWER> <UPPER>
# https://blog.eduonix.com/shell-scripting/generating-random-numbers-in-linux-shell-scripting/
randomIntRange() {
    if [ "$#" -ne 2 ] ; then echo "Usage: randomIntRange <LOWER> <UPPER>" >&2; return 1; fi
    rand=$$
    diff=$(($2 - $1 + 1))
    echo $((rand%diff + $1))
}

# sqrt <VALUE>
# https://stackoverflow.com/a/59263103/7295428
sqrt() {
    if [ "$#" -ne 1 ] ; then echo "Usage: sqrt <VALUE>" >&2; return 1; fi
    divider=0
    while true; do
        divider=$((divider + 1))
        sqrt=$(($1 / divider))
        if [[ $divider -eq $sqrt ]] || [[ $divider -gt $sqrt ]]; then break; fi
    done
    echo $sqrt
}

# toPercent <VALUE> <MAX>
toPercent() {
    if [ "$#" -ne 2 ] ; then echo "Usage: toPercent <VALUE> <MAX>" >&2; return 1; fi
    echo $(($1 * 100 / $2))
}
