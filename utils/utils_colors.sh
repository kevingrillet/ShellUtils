#!/bin/bash
# ##############################################################################
# Script Name   : utils_colors.sh
# Description   : Common function for shell projects working with colors
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# Require       : utils_maths.sh
# ##############################################################################
[ -n "${UTILS_COLORS}" ] && return; UTILS_COLORS=0; #pragma once

# ##############################################################################
# Function Name : sRGBColorDelta
# Args          : <COLOR1> <COLOR2>
# Output        : stdout [0 means same colors, 100 means opposite colors]
# Source        : https://stackoverflow.com/a/22692625/7295428
# ##############################################################################
sRGBColorDelta() {
    if [ "$#" -ne 2 ] ; then
        echo "Usage: sRGBColorDelta <COLOR1> <COLOR2>" >&2
        echo " 0 means same colors, 100 means opposite colors" >&2
        return 1
    fi
    r=$((0x${1:0:2} - 0x${2:0:2}))
    g=$((0x${1:2:2} - 0x${2:2:2}))
    b=$((0x${1:4:2} - 0x${2:4:2}))
    d=$((((765 - (${r#-} + ${g#-} + ${b#-})) * 100) / 765))                     # 765 = 3 * 255
    d=$((100-d))
    echo $d >&1
}

# ##############################################################################
# Function Name : sRGBColorDistance
# Args          : <COLOR1> <COLOR2>
# Output        : stdout (6468 means opposit colors, 0 means same colors)
# Source        : https://stackoverflow.com/a/9085524/7295428
# ##############################################################################
sRGBColorDistance() {
    if [ "$#" -ne 2 ] ; then
        echo "Usage: sRGBColorDistance <COLOR1> <COLOR2>" >&2
        echo " 6468 means opposit colors, 0 means same colors" >&2
        return 1
    fi
    rmean=$(((0x${1:0:2} + 0x${2:0:2}) / 2))
    r=$((0x${1:0:2} - 0x${2:0:2}))
    g=$((0x${1:2:2} - 0x${2:2:2}))
    b=$((0x${1:4:2} - 0x${2:4:2}))
    d=$(((((512 + rmean) * r * r) / 2) + 4 * g * g + (((767 - rmean) * b * b) / 2)))
    sqrt $d
}

# ##############################################################################
# Section       : sRGB Euclidean Distance
# Source        : https://www.compuphase.com/cmetric.htm
# ##############################################################################

# ##############################################################################
# Function Name : sRGBEuclideanDistance
# Args          : <COLOR1> <COLOR2>
# Output        : stdout (441 means opposit colors, 0 means same colors)
# Source        : https://www.compuphase.com/cmetric.htm
# ##############################################################################
sRGBEuclideanDistance() {
    if [ "$#" -ne 2 ] ; then
        echo "Usage: sRGBEuclideanDistance <COLOR1> <COLOR2>" >&2
        echo " 441 means opposit colors, 0 means same colors" >&2
        return 1
    fi
    r=$((0x${1:0:2} - 0x${2:0:2}))
    g=$((0x${1:2:2} - 0x${2:2:2}))
    b=$((0x${1:4:2} - 0x${2:4:2}))
    d=$((r * r + g * g + b * b))
    sqrt $d
}

# ##############################################################################
# Function Name : sRGBEuclideanDistanceWeighted
# Args          : <COLOR1> <COLOR2>
# Output        : stdout (765 means opposit colors, 0 means same colors)
# Source        : https://www.compuphase.com/cmetric.htm
# ##############################################################################
sRGBEuclideanDistanceWeighted() {
    if [ "$#" -ne 2 ] ; then
        echo "Usage: sRGBEuclideanDistanceWeighted <COLOR1> <COLOR2>" >&2
        echo " 765 means opposit colors, 0 means same colors" >&2
        return 1
    fi
    rmean=$(((0x${1:0:2} + 0x${2:0:2}) / 2))
    r=$((0x${1:0:2} - 0x${2:0:2}))
    g=$((0x${1:2:2} - 0x${2:2:2}))
    b=$((0x${1:4:2} - 0x${2:4:2}))
    if [[ $rmean -lt 128 ]]; then
        d=$((2 * r * r + 4 * g * g + 3 * b * b))
    else
        d=$((3 * r * r + 4 * g * g + 2 * b * b))
    fi
    sqrt $d
}

# ##############################################################################
# Function Name : sRGBEuclideanDistanceRedmean
# Description   : A low-cost approximation
# Args          : <COLOR1> <COLOR2>
# Output        : stdout (721 means opposit colors, 0 means same colors)
# Source        : https://www.compuphase.com/cmetric.htm
# ##############################################################################
sRGBEuclideanDistanceRedmean() {
    if [ "$#" -ne 2 ] ; then
        echo "Usage: sRGBEuclideanDistanceRedmean <COLOR1> <COLOR2>" >&2
        echo " 721 means opposit colors, 0 means same colors" >&2
        return 1
    fi
    rmean=$(((0x${1:0:2} + 0x${2:0:2}) / 2))
    r=$((0x${1:0:2} - 0x${2:0:2}))
    g=$((0x${1:2:2} - 0x${2:2:2}))
    b=$((0x${1:4:2} - 0x${2:4:2}))
    d=$(((2 + rmean / 256) * r * r + 4 * g * g + (2 + (255 - rmean) / 256) * b * b))
    sqrt $d
}

# ##############################################################################
# Function Name : sRGBExtractColor
# Description   : Extract color from RGB
# Args          : <COLOR> <R/G/B>
# Output        : stdout
# ##############################################################################
sRGBExtractColor() {
    if [ "$#" -ne 2 ]; then echo "Usage: sRGBExtractColor <COLOR> <R/G/B>" >&2; return 1; fi
    case $2 in
        r|R)
            echo "${1:0:2}" >&1
            ;;
        g|G)
            echo "${1:2:2}" >&1
            ;;
        b|B)
            echo "${1:4:2}" >&1
            ;;
    esac
}

# ##############################################################################
# Section       : sRGB Luminance
# Source        : https://stackoverflow.com/a/596243/7295428
# ##############################################################################

# ##############################################################################
# Function Name : sRGBLuminance
# Args          : <COLOR>
# Output        : stdout (255 means light, 0 means dark)
# Source        : https://en.wikipedia.org/wiki/Relative_luminance
# ##############################################################################
sRGBLuminance() {
    if [ "$#" -ne 1 ] ; then
        echo "Usage: sRGBLuminance <COLOR>" >&2
        echo " 255 means light, 0 means dark" >&2
        return 1
    fi
    r=$((0x${1:0:2}))
    g=$((0x${1:2:2}))
    b=$((0x${1:4:2}))
    l=$(((2126 * r + 7152 * g + 722 * b) / 10000))
    echo $l >&1
}

# ##############################################################################
# Function Name : sRGBLuminanceW3
# Args          : <COLOR>
# Output        : stdout (255 means light, 0 means dark)
# Source        : https://www.w3.org/TR/AERT/#color-contrast
# ##############################################################################
sRGBLuminanceW3() {
    if [ "$#" -ne 1 ] ; then
        echo "Usage: sRGBLuminanceW3 <COLOR>" >&2
        echo " 255 means light, 0 means dark" >&2
        return 1
    fi
    r=$((0x${1:0:2}))
    g=$((0x${1:2:2}))
    b=$((0x${1:4:2}))
    l=$(((299 * r + 587 * g + 114 * b) / 1000))
    echo $l >&1
}

# ##############################################################################
# Function Name : sRGBLuminanceHSP
# Args          : <COLOR>
# Output        : stdout (255 means light, 0 means dark)
# Source        : https://alienryderflex.com/hsp.html
# ##############################################################################
sRGBLuminanceHSP() {
    if [ "$#" -ne 1 ] ; then
        echo "Usage: sRGBLuminanceHSP <COLOR>" >&2
        echo " 255 means light, 0 means dark" >&2
        return 1
    fi
    r=$((0x${1:0:2}))
    g=$((0x${1:2:2}))
    b=$((0x${1:4:2}))
    l=$(((299 * r * r + 587 * g * g + 114 * b * b) / 1000))
    sqrt $l
}
