#!/bin/bash
# ##############################################################################
# Script Name   : utils_ini.sh
# Description   : Common function for shell projects working with .inii files
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# ##############################################################################
[ -n "${UTILS_INI}" ] && return; UTILS_INI=0; #pragma once

# ##############################################################################
# Function Name : getIniValue
# Description   : Output the first matching <PARAM>, in the matching <SECTION>
# Args          : <FILE> <SECTION> <PARAM> [<DEFAULT>]
# Output        : stdout Value (or <DEFAULT>)
# ##############################################################################
getIniValue() {
    if [ "$#" -ne 3 ] && [ "$#" -ne 4 ] ; then
        echo "getIniValue <FILE> <SECTION> <PARAM> [<DEFAULT>]" >&2; return 1;
    fi
    _getIniValue_section=""
    _getIniValue_param=""
    _getIniValue_value=""
    if [ -f "$1" ]; then                                                        # File exists
        while read -r line; do
            if [[ "$line" =~ ^\[(.*)\]$ ]]; then                                # Match [section]
                _getIniValue_section=${BASH_REMATCH[1]}                         # Save section
            elif [ "$2" = "$_getIniValue_section" ] && [[ "$line" =~ ^(.*)=(.*)$ ]]; then                               # Match param=key
                _getIniValue_param=${BASH_REMATCH[1]}                           # Save param
                if [ "$3" = "$_getIniValue_param" ]; then
                    _getIniValue_value=${BASH_REMATCH[2]}                       # Save value
                    break                                                       # Break while
                fi
            fi
        done < "$1"                                                             # Read file
    else
        echo "[WARNING] The file [$1] does not exist." >&2;
    fi
    echo "${_getIniValue_value:-$4}" >&1
}

# ##############################################################################
# Function Name : getIniValueLight
# Description   : Output the first matching param
# Args          : <FILE> <PARAM> [<DEFAULT>]
# Output        : stdout Value (or <DEFAULT>)
# ##############################################################################
getIniValueLight() {
    if [ "$#" -ne 2 ] && [ "$#" -ne 3 ]; then
        echo "Usage: getIniValueLight <FILE> <PARAM> [<DEFAULT>]" >&2; return 1;
    fi
    _getIniValueLight_value=""
    if [ -f "$1" ]; then                                                        # File exists
        while read -r line; do
            if [[ "$line" =~ ^(.*)=(.*)$ ]]; then                               # Match param=key
                if [ "$2" = "${BASH_REMATCH[1]}" ]; then
                    _getIniValueLight_value="${BASH_REMATCH[2]}"
                    break                                                       # Break while
                fi
            fi
        done < "$1"                                                             # Read file
        echo "${_getIniValueLight_value:-$3}"
    else
        echo "[WARNING] The file [$1] does not exist." >&2;
        echo "$3" >&1                           # Echo DEFAULT
    fi
}

# ##############################################################################
# Function Name : getIniValueLighter
# Description   : Output the last matching param
# Note          : Warning: the ini file needs to don't have any [section]
# Args          : <FILE> <PARAM> [<DEFAULT>]
# Output        : stdout Value (or <DEFAULT>)
# ##############################################################################
getIniValueLighter() {
    if [ "$#" -ne 2 ] && [ "$#" -ne 3 ]; then
        echo "Usage: getIniValueLighter <FILE> <PARAM> [<DEFAULT>]" >&2; return 1;
    fi
    if [ -f "$1" ]; then                        # File exists
        . "$1"                                  # Add as source the .ini file
        # eval "echo \"\$$2\""                  # Alternative if ${!2} does not work
        if [ -n "${!2}" ]; then
            echo "${!2}" >&1                    # Echo the param (Substring expansion)
        else
            echo "$3" >&1
        fi
    else
        echo "[WARNING] The file [$1] does not exist." >&2;
        echo "$3" >&1                           # Echo DEFAULT
    fi
}

# ##############################################################################
# Function Name : setIniValue
# Description   : Insert/Update <PARAM>=<VALUE> of <FILE>
# Args          : <FILE> <SECTION> <PARAM> <VALUE>
# Output        : <FILE> updated
# ##############################################################################
setIniValue() {
    if [ "$#" -ne 4 ] ; then echo "Usage: setIniValue <FILE> <SECTION> <PARAM> <VALUE>" >&2; return 1; fi
    _setIniValue_temp=$(mktemp)                 # Create temp file (will be replacing the .ini file)
    _setIniValue_section=""
    _setIniValue_param=""
    if [ -f "$1" ]; then
        _setIniValue_added=false
        while read -r line; do
            if [[ "$line" =~ ^\[(.*)\]$ ]]; then
                if [ "$2" = "$_setIniValue_section" ]; then                     # New section, but was in the good one
                    if [ $_setIniValue_added = false ]; then                    # And not already added
                        echo "$3=$4" >> "$_setIniValue_temp"                    # Add param=value
                        _setIniValue_added=true
                    fi
                fi
                _setIniValue_section=${BASH_REMATCH[1]}
                echo "$line" >> "$_setIniValue_temp"                            # Print existing section
            elif [[ "$line" =~ ^(.*)=(.*)$ ]]; then
                _setIniValue_param=${BASH_REMATCH[1]}
                if [ "$2" = "$_setIniValue_section" ] && [ "$3" = "$_setIniValue_param" ]; then
                    echo "$3=$4" >> "$_setIniValue_temp"                        # Replace existing value
                    _setIniValue_added=true
                else
                    echo "$line" >> "$_setIniValue_temp"                        # Print existing param=value
                fi
            fi
        done < "$1"
        if [ $_setIniValue_added = false ]; then                                # Not added, new section
            { echo "[$2]"; echo "$3=$4"; } >> "$_setIniValue_temp"              # Add section & param=value
        fi
    else                                                                        # File does not exists
        { echo "[$2]"; echo "$3=$4"; } >> "$_setIniValue_temp"                  # Add section & param=value
    fi
    mv "$_setIniValue_temp" "$1"
}
