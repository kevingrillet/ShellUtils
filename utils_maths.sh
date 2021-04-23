#!/bin/bash
# https://www.shellcheck.net/

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
