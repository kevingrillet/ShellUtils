#!/bin/bash
# ./utils/utils_colors.sh
# https://www.shellcheck.net/
[ -n "${UTILS_COLORS}" ] && return; UTILS_COLORS=0; #pragma once

# sRGBColorDelta <COLOR1> <COLOR2>
# https://stackoverflow.com/a/22692625/7295428
# 0 means opposit colors, 100 means same colors
function sRGBColorDelta() {
    if [ "$#" -ne 2 ] ; then
        echo "Usage: sRGBColorDelta <COLOR1> <COLOR2>" >&2
        echo " 0 means opposit colors, 100 means same colors" >&2
        return 1
    fi
    color1=$1
    color2=$2
    r=$((0x${color1:0:2} - 0x${color2:0:2}))
    g=$((0x${color1:2:2} - 0x${color2:2:2}))
    b=$((0x${color1:4:2} - 0x${color2:4:2}))
    d=$(((((3 * 255) - (${r#-} + ${g#-} + ${b#-})) * 100) / (3 * 255)))
    echo $d
}

# sRGBColorDistance <COLOR1> <COLOR2>
# https://stackoverflow.com/a/9085524/7295428
# 6468 means opposit colors, 0 means same colors
function sRGBColorDistance() {
    if [ "$#" -ne 2 ] ; then
        echo "Usage: sRGBColorDistance <COLOR1> <COLOR2>" >&2
        echo " 6468 means opposit colors, 0 means same colors" >&2
        return 1
    fi
    color1=$1
    color2=$2
    rmean=$(((0x${color1:0:2} + 0x${color2:0:2}) / 2))
    r=$((0x${color1:0:2} - 0x${color2:0:2}))
    g=$((0x${color1:2:2} - 0x${color2:2:2}))
    b=$((0x${color1:4:2} - 0x${color2:4:2}))
    d=$(((((512 + rmean) * r * r) / 2) + 4 * g * g + (((767 - rmean) * b * b) / 2)))
    sqrt $d
}

##
 # sRGB Euclidean Distance
 # https://www.compuphase.com/cmetric.htm
 ##

# sRGBEuclideanDistance <COLOR1> <COLOR2>
# https://www.compuphase.com/cmetric.htm
# 441 means opposit colors, 0 means same colors
function sRGBEuclideanDistance() {
    if [ "$#" -ne 2 ] ; then
        echo "Usage: sRGBEuclideanDistance <COLOR1> <COLOR2>" >&2
        echo " 441 means opposit colors, 0 means same colors" >&2
        return 1
    fi
    color1=$1
    color2=$2
    r=$((0x${color1:0:2} - 0x${color2:0:2}))
    g=$((0x${color1:2:2} - 0x${color2:2:2}))
    b=$((0x${color1:4:2} - 0x${color2:4:2}))
    d=$((r * r + g * g + b * b))
    sqrt $d
}

# sRGBEuclideanDistanceWeighted <COLOR1> <COLOR2>
# https://www.compuphase.com/cmetric.htm
# 765 means opposit colors, 0 means same colors
function sRGBEuclideanDistanceWeighted() {
    if [ "$#" -ne 2 ] ; then
        echo "Usage: sRGBEuclideanDistanceWeighted <COLOR1> <COLOR2>" >&2
        echo " 765 means opposit colors, 0 means same colors" >&2
        return 1
    fi
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

# sRGBEuclideanDistanceRedmean <COLOR1> <COLOR2>
# A low-cost approximation
# https://www.compuphase.com/cmetric.htm
# 721 means opposit colors, 0 means same colors
function sRGBEuclideanDistanceRedmean() {
    if [ "$#" -ne 2 ] ; then
        echo "Usage: sRGBEuclideanDistanceRedmean <COLOR1> <COLOR2>" >&2
        echo " 721 means opposit colors, 0 means same colors" >&2
        return 1
    fi
    color1=$1
    color2=$2
    rmean=$(((0x${color1:0:2} + 0x${color2:0:2}) / 2))
    r=$((0x${color1:0:2} - 0x${color2:0:2}))
    g=$((0x${color1:2:2} - 0x${color2:2:2}))
    b=$((0x${color1:4:2} - 0x${color2:4:2}))
    d=$(((2 + rmean / 256) * r * r + 4 * g * g + (2 + (255 - rmean) / 256) * b * b))
    sqrt $d
}

# sRGBExtractColor <COLOR> <R/G/B>
function sRGBExtractColor() {
    if [ "$#" -ne 2 ]; then echo "Usage: sRGBExtractColor <COLOR> <R/G/B>" >&2; return 1; fi
    color=$1
    ext=$2
    case $ext in
        r|R)
            echo ${color:0:2}
            ;;
        g|G)
            echo ${color:2:2}
            ;;
        b|B)
            echo ${color:4:2}
            ;;
    esac
}

##
 # sRGB Luminance
 # https://stackoverflow.com/a/596243/7295428
 ##

# sRGBLuminance <COLOR>
# https://en.wikipedia.org/wiki/Relative_luminance
# 255 means light, 0 means dark
function sRGBLuminance() {
    if [ "$#" -ne 1 ] ; then
        echo "Usage: sRGBLuminance <COLOR>" >&2
        echo " 255 means light, 0 means dark" >&2
        return 1
    fi
    color=$1
    r=$((0x${color:0:2}))
    g=$((0x${color:2:2}))
    b=$((0x${color:4:2}))
    l=$(((2126 * r + 7152 * g + 722 * b) / 10000))
    echo $l
}

# sRGBLuminanceW3 <COLOR>
# https://www.w3.org/TR/AERT/#color-contrast
# 255 means light, 0 means dark
function sRGBLuminanceW3() {
    if [ "$#" -ne 1 ] ; then
        echo "Usage: sRGBLuminanceW3 <COLOR>" >&2
        echo " 255 means light, 0 means dark" >&2
        return 1
    fi
    color=$1
    r=$((0x${color:0:2}))
    g=$((0x${color:2:2}))
    b=$((0x${color:4:2}))
    l=$(((299 * r + 587 * g + 114 * b) / 1000))
    echo $l
}

# sRGBLuminanceHSP <COLOR>
# https://alienryderflex.com/hsp.html
# 255 means light, 0 means dark
function sRGBLuminanceHSP() {
    if [ "$#" -ne 1 ] ; then
        echo "Usage: sRGBLuminanceHSP <COLOR>" >&2
        echo " 255 means light, 0 means dark" >&2
        return 1
    fi
    color=$1
    r=$((0x${color:0:2}))
    g=$((0x${color:2:2}))
    b=$((0x${color:4:2}))
    l=$(((299 * r * r + 587 * g * g + 114 * b * b) / 1000))
    sqrt $l
}
