#!/bin/bash
# https://www.shellcheck.net/

# my_exec <COMMAND>
# hide the output if verbose is false
function my_exec {
  if [ $VERBOSE = true ] ;
  then
    "$@"
  else
    "$@" &>/dev/null
  fi
}

# pause
function pause {
  read -s -r -n 1 -p "Press any key to continue..."
  echo ""
}

# printVerbose <MESSAGE>
# print if verbose
function printVerbose {
  if [ $VERBOSE = true ] ;
  then
    echo -e "$1"
  fi
}
