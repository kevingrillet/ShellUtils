#!/bin/bash
# ##############################################################################
# Script Name   : exp_function.sh
# Description   : Experiment around Bash function
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# ##############################################################################

functionTest() {
    functionAfter
}

functionTest                                    # Output: ./exp_function.sh: line 11: functionAfter: command not found

functionAfter() {
    echo "OK"
}

functionTest                                    # Output: Ok
