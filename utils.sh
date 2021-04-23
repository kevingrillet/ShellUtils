#!/bin/bash
# https://www.shellcheck.net/

# my_exec <COMMAND>
# just to hide the output if verbose if off
function my_exec {
  if [ $VERBOSE = true ] ;
  then
    "$@"
  else
    "$@" &>/dev/null
  fi
}

# output <MESSAGE>
# echo if verbose
function output {
  if [ $VERBOSE = true ] ;
  then
    echo -e "$1"
  fi
}

# pause
function pause {
  read -s -r -n 1 -p "Press any key to continue..."
  echo ""
}
