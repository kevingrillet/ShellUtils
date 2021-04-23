#!/bin/bash
# https://www.shellcheck.net/

# colorDistance <COLOR1> <COLOR2>
# The result should be send to sqrt
# https://stackoverflow.com/a/9085524/7295428
# 41843587 means opposit colors, 0 means same colors
function colorDistance() {
    color1=$1
    color2=$2
    rmean=$(((0x${color1:0:2} + 0x${color2:0:2}) / 2))
    r=$((0x${color1:0:2} - 0x${color2:0:2}))
    g=$((0x${color1:2:2} - 0x${color2:2:2}))
    b=$((0x${color1:4:2} - 0x${color2:4:2}))
    d=$(((((512 + rmean) * r * r) / 2) + 4 * g * g + (((767 - rmean) * b * b) / 2)))
    echo $d
}
# time colorDistance 000000 000000 # output: 0
# time colorDistance 000000 ffffff # output: 41843587 (sqrt > 6468)

# hexColorDelta <COLOR1> <COLOR2>
# https://stackoverflow.com/a/22692625/7295428
# 0 means opposit colors, 100 means same colors
function hexColorDelta() {
    color1=$1
    color2=$2
    r=$((0x${color1:0:2} - 0x${color2:0:2}))
    r=$((255-${r#-}))
    g=$((0x${color1:2:2} - 0x${color2:2:2}))
    g=$((255-${g#-}))
    b=$((0x${color1:4:2} - 0x${color2:4:2}))
    b=$((255-${b#-}))
    d=$((((r + g + b ) * 100) / (3 * 255)))
    echo $d
}
# time hexColorDelta 000000 000000 # output: 100    => same color = 100%
# time hexColorDelta ff0000 0000ff # output: 33     => G = 0 in both so 33%
# time hexColorDelta ffff00 0000ff # output: 0      => opposite = 0%
# time hexColorDelta 000000 ffffff # output: 0      => opposite = 0%
