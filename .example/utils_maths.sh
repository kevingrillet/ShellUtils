#!/bin/bash
# .example/utils_maths.sh
# https://www.shellcheck.net/
source ../utils_maths.sh

abs
abs -1

convertHexToDec
convertHexToDec 14 # output: 20

pow
pow 10 2

echo "randomInt"
randomInt

randomIntRange
randomIntRange 256 1024

sqrt
sqrt 100 # output: 10

toPercent
toPercent 510 721
