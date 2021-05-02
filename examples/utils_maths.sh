#!/bin/bash
# ##############################################################################
# Script Name   : utils_maths.sh
# Description   : Demo of utils_maths.sh
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# Require       : utils_maths.sh
# ##############################################################################
. ../utils/utils_maths.sh

abs
abs -1                                          # output: 1

convertHexToDec
convertHexToDec 14                              # output: 20

pow
pow 10 2                                        # output: 100

echo "randomInt"
randomInt

randomIntRange
randomIntRange 256 1024

sqrt
sqrt 100                                        # output: 10

toPercent
toPercent 510 721                               # output: 70
