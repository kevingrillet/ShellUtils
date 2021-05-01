#!/bin/bash
# ./examples/utils_ini.sh
# https://www.shellcheck.net/
source ../utils/utils_ini.sh

getIniValue
getIniValue example.ini section2 param1 "default"                               # output: test21
getIniValue example.ini section3 param1 "default"                               # output: default

getIniValueLight
getIniValueLight example.ini param1                                             # output: test11

getIniValueLighter
getIniValueLighter example_lighter.ini param2                                   # output: test2

setIniValue
setIniValue example2.ini section21 param1 "test211"
setIniValue example2.ini section21 param1 "test2112"
setIniValue example2.ini section22 param2 "test222"
cat example2.ini
# output:
# [section21]
# param1=test2112
# [section22]
# param2=test222
rm example2.ini
