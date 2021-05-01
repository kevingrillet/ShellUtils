#!/bin/bash
# ./experiments/exp_getopts.sh
# http://mywiki.wooledge.org/BashFAQ/035#getopts
# https://stackoverflow.com/a/30026641/7295428

# Usage info
show_help() {
    echo "Usage: ${0##*/} [-hv] [-f OUTFILE]"
    echo "    -h|--help     display this help and exit"
    echo "    -o OUTFILE    write the result to OUTFILE instead of standard output."
    echo "    -v            verbose mode. Can be used multiple times for increased verbosity."
}

# Transform long options to short ones
for arg in "$@"; do
    shift
    case "$arg" in
        "--help") set -- "$@" "-h" ;;
        *)        set -- "$@" "$arg"
    esac
done

# Initialize our own variables:
output_file=""
verbose=0

OPTIND=1
# Resetting OPTIND is necessary if getopts was used previously in the script.
# It is a good idea to make OPTIND local if you process options in a function.

while getopts ":hvo:" opt; do
    case $opt in
        h)
            show_help
            exit 0
            ;;
        v)
            verbose=$((verbose+1))
            ;;
        o)
            output_file=$OPTARG
            ;;
        :)
            echo "Argument required by this option: $OPTARG"
            exit 1
            ;;
        \?)
            echo "$OPTARG : Invalid option"
            exit 1
            ;;
    esac
done

if [ $verbose -ge 1 ]; then echo "Test verbose"; fi
if [ -n "$output_file" ]; then echo "Test output" > "$output_file"; fi

# $ ./exp_getopts.sh -h
# Usage: exp_getopts.sh [-hv] [-f OUTFILE]
#     -h|--help     display this help and exit
#     -o OUTFILE    write the result to OUTFILE instead of standard output.
#     -v            verbose mode. Can be used multiple times for increased verbosity.

# $ ./exp_getopts.sh --help
# Usage: exp_getopts.sh [-hv] [-f OUTFILE]
#     -h|--help     display this help and exit
#     -o OUTFILE    write the result to OUTFILE instead of standard output.
#     -v            verbose mode. Can be used multiple times for increased verbosity.

# $ ./exp_getopts.sh -x
# x : Invalid option

# $ ./exp_getopts.sh -o
# Argument required by this option: o

# $ ./exp_getopts.sh -v
# Test verbose

# $ ./exp_getopts.sh -o test
