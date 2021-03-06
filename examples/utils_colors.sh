#!/bin/bash
# ##############################################################################
# Script Name   : utils_colors.sh
# Description   : Demo of utils_colors.sh
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# Require       : utils_maths.sh, utils_colors.sh
# ##############################################################################
. ../utils/utils_maths.sh
. ../utils/utils_colors.sh

sRGBColorDelta
sRGBColorDelta 000000 000000                    # output: 0
sRGBColorDelta ff0000 0000ff                    # output: 67
sRGBColorDelta ffff00 0000ff                    # output: 100
sRGBColorDelta 000000 ffffff                    # output: 100

sRGBColorDistance
sRGBColorDistance 000000 000000                 # output: 0
sRGBColorDistance ff0000 0000ff                 # output: 6468
sRGBColorDistance 000000 ffffff                 # output: 6468

sRGBEuclideanDistance
sRGBEuclideanDistance 000000 000000             # output: 0
sRGBEuclideanDistance ff0000 0000ff             # output: 360
sRGBEuclideanDistance ffff00 0000ff             # output: 441
sRGBEuclideanDistance 000000 ffffff             # output: 441

sRGBEuclideanDistanceWeighted
sRGBEuclideanDistanceWeighted 000000 000000     # output: 0
sRGBEuclideanDistanceWeighted ff0000 0000ff     # output: 570
sRGBEuclideanDistanceWeighted ffff00 ff00ff     # output: 624
sRGBEuclideanDistanceWeighted ffff00 0000ff     # output: 765
sRGBEuclideanDistanceWeighted 000000 ffffff     # output: 765

sRGBEuclideanDistanceRedmean
sRGBEuclideanDistanceRedmean 000000 000000      # output: 0
sRGBEuclideanDistanceRedmean ff0000 0000ff      # output: 510
sRGBEuclideanDistanceRedmean ffff00 ff00ff      # output: 624
sRGBEuclideanDistanceRedmean ffff00 0000ff      # output: 721
sRGBEuclideanDistanceRedmean 000000 ffffff      # output: 721

sRGBExtractColor
sRGBExtractColor 00ff00 G                       # output: ff

sRGBLuminance
sRGBLuminance 000000                            # output: 0
sRGBLuminance ff0000                            # output: 54
sRGBLuminance 00ff00                            # output: 182
sRGBLuminance 0000ff                            # output: 18
sRGBLuminance ffffff                            # output: 255

sRGBLuminance
sRGBLuminanceW3 000000                          # output: 0
sRGBLuminanceW3 ff0000                          # output: 76
sRGBLuminanceW3 00ff00                          # output: 149
sRGBLuminanceW3 0000ff                          # output: 29
sRGBLuminanceW3 ffffff                          # output: 255

sRGBLuminanceHSP
sRGBLuminanceHSP 000000                         # output: 0
sRGBLuminanceHSP ff0000                         # output: 139
sRGBLuminanceHSP 00ff00                         # output: 195
sRGBLuminanceHSP 0000ff                         # output: 86
sRGBLuminanceHSP ffffff                         # output: 255
