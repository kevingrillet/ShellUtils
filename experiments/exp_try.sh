#!/bin/bash
# ##############################################################################
# Script Name   : exp_try.sh
# Description   : Experiment around Test
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# ##############################################################################

currentPos="default"
tries=0

# ##############################################################################
# Function Name : checkToDo
# Description   : Check if argument is ToDo
# Args          : <TODO>: boolean
# Output        : return 0/1
# ##############################################################################
checkToDo() {
    if [ "$(eval echo \$"$1")" = false ]; then
        return 1
    fi
    if [ "$1" = "$currentPos" ]; then
        tries=$((tries+1))
    else
        eval "$currentPos"=false
        currentPos="$1"
        tries=0
    fi
    if [ $tries -lt 3 ]; then
        return 0
    else
        eval "$1"=false
        return 1
    fi
}

doTest0=true
doTest1=true
doTest2=true

if checkToDo "doTest0"; then echo "$currentPos [tries=$tries]"; fi
if checkToDo "doTest1"; then echo "$currentPos [tries=$tries]"; fi
if checkToDo "doTest1"; then echo "$currentPos [tries=$tries]"; fi
if checkToDo "doTest1"; then echo "$currentPos [tries=$tries]"; fi
if checkToDo "doTest1"; then echo "$currentPos [tries=$tries]"; fi
if checkToDo "doTest1"; then echo "$currentPos [tries=$tries]"; fi
if checkToDo "doTest1"; then echo "$currentPos [tries=$tries]"; fi
if checkToDo "doTest2"; then echo "$currentPos [tries=$tries]"; fi
if checkToDo "doTest0"; then echo "$currentPos [tries=$tries]"; fi
if checkToDo "doTest1"; then echo "$currentPos [tries=$tries]"; fi
