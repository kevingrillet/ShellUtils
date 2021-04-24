#!/bin/bash
# utils.sh
# https://www.shellcheck.net/
[ -n "${UTILS}" ] && return; UTILS=0; #pragma once

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
