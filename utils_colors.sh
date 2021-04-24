#!/bin/bash
# utils_colors.sh
# https://www.shellcheck.net/
[ -n "${UTILS_COLORS}" ] && return; UTILS_COLORS=0; #pragma once
source utils_maths.sh

# sRGBColorDelta <COLOR1> <COLOR2>
# https://stackoverflow.com/a/22692625/7295428
# 0 means opposit colors, 100 means same colors
function sRGBColorDelta() {
    color1=$1
    color2=$2
    r=$((0x${color1:0:2} - 0x${color2:0:2}))
    g=$((0x${color1:2:2} - 0x${color2:2:2}))
    b=$((0x${color1:4:2} - 0x${color2:4:2}))
    d=$(((((3 * 255) - (${r#-} + ${g#-} + ${b#-})) * 100) / (3 * 255)))
    echo $d
}
# time sRGBColorDelta 000000 000000 # output: 100    => same color = 100%
# time sRGBColorDelta ff0000 0000ff # output: 33     => G = 0 in both so 33%
# time sRGBColorDelta ffff00 0000ff # output: 0      => opposite = 0%
# time sRGBColorDelta 000000 ffffff # output: 0      => opposite = 0%

# sRGBColorDistance <COLOR1> <COLOR2>
# https://stackoverflow.com/a/9085524/7295428
# 6468 means opposit colors, 0 means same colors
function sRGBColorDistance() {
    color1=$1
    color2=$2
    rmean=$(((0x${color1:0:2} + 0x${color2:0:2}) / 2))
    r=$((0x${color1:0:2} - 0x${color2:0:2}))
    g=$((0x${color1:2:2} - 0x${color2:2:2}))
    b=$((0x${color1:4:2} - 0x${color2:4:2}))
    d=$(((((512 + rmean) * r * r) / 2) + 4 * g * g + (((767 - rmean) * b * b) / 2)))
    sqrt $d
}
# time sRGBColorDistance 000000 000000 # output: 0
# time sRGBColorDistance ff0000 0000ff # output: 6468
# time sRGBColorDistance 000000 ffffff # output: 6468

##
 # sRGB Euclidean Distance
 # https://www.compuphase.com/cmetric.htm
 ##

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

##
 # sRGB Luminance
 # https://stackoverflow.com/a/596243/7295428
 ##

# sRGBLuminance <COLOR>
# https://en.wikipedia.org/wiki/Relative_luminance
# 255 means light, 0 means dark
function sRGBLuminance() {
    color=$1
    r=$((0x${color:0:2}))
    g=$((0x${color:2:2}))
    b=$((0x${color:4:2}))
    l=$(((2126 * r + 7152 * g + 722 * b) / 10000))
    echo $l
}
# time sRGBLuminance 000000 # output: 0
# time sRGBLuminance ff0000 # output: 54
# time sRGBLuminance 00ff00 # output: 182
# time sRGBLuminance 0000ff # output: 18
# time sRGBLuminance ffffff # output: 255

# sRGBLuminanceW3 <COLOR>
# https://www.w3.org/TR/AERT/#color-contrast
# 255 means light, 0 means dark
function sRGBLuminanceW3() {
    color=$1
    r=$((0x${color:0:2}))
    g=$((0x${color:2:2}))
    b=$((0x${color:4:2}))
    l=$(((299 * r + 587 * g + 114 * b) / 1000))
    echo $l
}
# time sRGBLuminanceW3 000000 # output: 0
# time sRGBLuminanceW3 ff0000 # output: 76
# time sRGBLuminanceW3 00ff00 # output: 149
# time sRGBLuminanceW3 0000ff # output: 29
# time sRGBLuminanceW3 ffffff # output: 255


# sRGBLuminanceHSP <COLOR>
# https://alienryderflex.com/hsp.html
# 255 means light, 0 means dark
function sRGBLuminanceHSP() {
    color=$1
    r=$((0x${color:0:2}))
    g=$((0x${color:2:2}))
    b=$((0x${color:4:2}))
    l=$(((299 * r * r + 587 * g * g + 114 * b * b) / 1000))
    sqrt $l
}
# time sRGBLuminanceHSP 000000 # output: 0
# time sRGBLuminanceHSP ff0000 # output: 139
# time sRGBLuminanceHSP 00ff00 # output: 195
# time sRGBLuminanceHSP 0000ff # output: 86
# time sRGBLuminanceHSP ffffff # output: 255
