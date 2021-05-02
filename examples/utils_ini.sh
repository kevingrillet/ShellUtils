#!/bin/bash
# ##############################################################################
# Script Name   : utils_ini.sh
# Description   : Demo of utils_ini.sh
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# Require       : utils_ini.sh
# ##############################################################################
. ../utils/utils_ini.sh

getIniValue
getIniValue example.ini section2 param1 "default"                               # output: test21
getIniValue example.ini section3 param1 "default"                               # output: default

getIniValueLight
getIniValueLight example.ini param1                                             # output: test11
getIniValueLight example.ini param5 "default"                                   # output: default

getIniValueLighter
getIniValueLighter example_lighter.ini param2                                   # output: test2
getIniValueLighter example_lighter.ini param5 "default"                         # output: default

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
