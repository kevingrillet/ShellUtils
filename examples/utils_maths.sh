#!/bin/bash
# ./examples/utils_maths.sh
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
