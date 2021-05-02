#!/bin/bash
# ##############################################################################
# Script Name   : exp_args.sh
# Description   : Experiment around Args
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# ##############################################################################

echo "$*"

for arg in "$@"; do
    shift
    case "$arg" in
        -d)
            shift
            ;;
        -f)
            ;;
        *)
            set -- "$@" "$arg"
            ;;
    esac
done

echo "$*"

# $ ./exp_args.sh -d delta -f x y color
# -d delta -f x y color
# x y color
