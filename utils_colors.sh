#!/bin/bash
# https://www.shellcheck.net/
source utils_maths.sh

# colorDistance <COLOR1> <COLOR2>
# https://stackoverflow.com/a/9085524/7295428
# 6468 means opposit colors, 0 means same colors
function colorDistance() {
    color1=$1
    color2=$2
    rmean=$(((0x${color1:0:2} + 0x${color2:0:2}) / 2))
    r=$((0x${color1:0:2} - 0x${color2:0:2}))
    g=$((0x${color1:2:2} - 0x${color2:2:2}))
    b=$((0x${color1:4:2} - 0x${color2:4:2}))
    d=$(((((512 + rmean) * r * r) / 2) + 4 * g * g + (((767 - rmean) * b * b) / 2)))
    sqrt $d
}
# time colorDistance 000000 000000 # output: 0
# time colorDistance ff0000 0000ff # output: 6468
# time colorDistance 000000 ffffff # output: 6468

# hexColorDelta <COLOR1> <COLOR2>
# https://stackoverflow.com/a/22692625/7295428
# 0 means opposit colors, 100 means same colors
function hexColorDelta() {
    color1=$1
    color2=$2
    r=$((0x${color1:0:2} - 0x${color2:0:2}))
    g=$((0x${color1:2:2} - 0x${color2:2:2}))
    b=$((0x${color1:4:2} - 0x${color2:4:2}))
    d=$(((((3 * 255) - (${r#-} + ${g#-} + ${b#-})) * 100) / (3 * 255)))
    echo $d
}
# time hexColorDelta 000000 000000 # output: 100    => same color = 100%
# time hexColorDelta ff0000 0000ff # output: 33     => G = 0 in both so 33%
# time hexColorDelta ffff00 0000ff # output: 0      => opposite = 0%
# time hexColorDelta 000000 ffffff # output: 0      => opposite = 0%

# sRGBEuclideanDistance <COLOR1> <COLOR2>
# https://www.compuphase.com/cmetric.htm
# 441 means opposit colors, 0 means same colors
function sRGBEuclideanDistance() {
    color1=$1
    color2=$2
    r=$((0x${color1:0:2} - 0x${color2:0:2}))
    g=$((0x${color1:2:2} - 0x${color2:2:2}))
    b=$((0x${color1:4:2} - 0x${color2:4:2}))
    d=$((r * r + g * g + b * b))
    sqrt $d
}
# time sRGBEuclideanDistance 000000 000000 # output: 0
# time sRGBEuclideanDistance ff0000 0000ff # output: 360
# time sRGBEuclideanDistance ffff00 0000ff # output: 441
# time sRGBEuclideanDistance 000000 ffffff # output: 441

# sRGBEuclideanDistanceWeighted <COLOR1> <COLOR2>
# https://www.compuphase.com/cmetric.htm
# 765 means opposit colors, 0 means same colors
function sRGBEuclideanDistanceWeighted() {
    color1=$1
    color2=$2
    rmean=$(((0x${color1:0:2} + 0x${color2:0:2}) / 2))
    r=$((0x${color1:0:2} - 0x${color2:0:2}))
    g=$((0x${color1:2:2} - 0x${color2:2:2}))
    b=$((0x${color1:4:2} - 0x${color2:4:2}))
    if [[ $rmean -lt 128 ]]; then
        d=$((2 * r * r + 4 * g * g + 3 * b * b))
    else
        d=$((3 * r * r + 4 * g * g + 2 * b * b))
    fi
    sqrt $d
}
# time sRGBEuclideanDistanceWeighted 000000 000000 # output: 0
# time sRGBEuclideanDistanceWeighted ff0000 0000ff # output: 570
# time sRGBEuclideanDistanceWeighted ffff00 ff00ff # output: 624
# time sRGBEuclideanDistanceWeighted ffff00 0000ff # output: 765
# time sRGBEuclideanDistanceWeighted 000000 ffffff # output: 765

# sRGBEuclideanDistanceRedmean <COLOR1> <COLOR2>
# A low-cost approximation
# https://www.compuphase.com/cmetric.htm
# 721 means opposit colors, 0 means same colors
function sRGBEuclideanDistanceRedmean() {
    color1=$1
    color2=$2
    rmean=$(((0x${color1:0:2} + 0x${color2:0:2}) / 2))
    r=$((0x${color1:0:2} - 0x${color2:0:2}))
    g=$((0x${color1:2:2} - 0x${color2:2:2}))
    b=$((0x${color1:4:2} - 0x${color2:4:2}))
    d=$(((2 + rmean / 256) * r * r + 4 * g * g + (2 + (255 - rmean) / 256) * b * b))
    sqrt $d
}
# time sRGBEuclideanDistanceRedmean 000000 000000 # output: 0
# time sRGBEuclideanDistanceRedmean ff0000 0000ff # output: 510
# time sRGBEuclideanDistanceRedmean ffff00 ff00ff # output: 624
# time sRGBEuclideanDistanceRedmean ffff00 0000ff # output: 721
# time sRGBEuclideanDistanceRedmean 000000 ffffff # output: 721
