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
nargs="$#"

echo "Number of args: $nargs [$scr $args]"

call () {
    # exec "$scr" "$args" # It's not working :( [Number of args = 1; illegal option]
    exec "$scr" $args # It's working :)
}

while getopts "ac:h" option; do
    case $option in
    a)
        ;;
    c)
        call
        exit
        ;;
    h)
        echo "./exp_exec.sh -a -c test"
        ;;
    :)
        printWarn "Argument required by this option: $OPTARG"
        exit 1
        ;;
    \?)
        printError "$OPTARG : Invalid option"
        exit 1
        ;;
    esac
done
