#!/bin/bash
# ./.experiments/exp_args.sh

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
