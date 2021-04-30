#!/bin/bash
# ./utils/utils_ini.sh
# https://www.shellcheck.net/

# getIniValue <FILE> <SECTION> <PARAM> <DEFAULT>
# Output the matching section > param
# stdout result
getIniValue() {
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
    fi
    echo "${_getIniValue_value:-$4}"
}

# getIniValueLight <FILE> <PARAM>
# Output the first param matching ignoring the section
# stdout result
getIniValueLight() {
    if [ -f "$1" ]; then                                                        # File exists
        while read -r line; do
            if [[ "$line" =~ ^(.*)=(.*)$ ]]; then                               # Match param=key
                if [ "$2" = "${BASH_REMATCH[1]}" ]; then
                    echo "${BASH_REMATCH[2]}"
                    break                                                       # Break while
                fi
            fi
        done < "$1"                                                             # Read file
    fi
}

# setIniValue <FILE> <SECTION> <PARAM> <VALUE>
# Insert, Update value
setIniValue() {
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
