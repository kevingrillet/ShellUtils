#!/bin/bash
# ##############################################################################
# Script Name   : exp_exec.sh
# Description   : Experiment around Exec
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# ##############################################################################

scr="$0"
args="$*"

call () {
    echo "$scr" "$args"
    exec "$scr" "$args"
}

call
