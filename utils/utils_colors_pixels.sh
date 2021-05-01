#!/bin/bash
# ##############################################################################
# Script Name   : utils_colors_pixels.sh
# Description   : Common function for shell projects using pixels
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# ##############################################################################
[ -n "${UTILS_COLORS_PIXELS}" ] && return; UTILS_COLORS_PIXELS=0; #pragma once

# TODO: it's BROKEN
# ##############################################################################
# Function Name : getRGBFromImagePixel
# Description   : Output RGB of the <IMAGE> pixel <X> <Y>
# Args          : <IMAGE> <X> <Y>
# Output        : stdout RGB of the pixel
# ##############################################################################
getRGBFromImagePixel() {
    # different file format, different header_offset
    offset=$((image_width * $3 + $2 + header_offset))
#    RGB=$(dd if="$1" bs=4 skip="$offset" count=1 2>/dev/null | hexdump -C)     # hexdump not in windows Git Bash :/
    dd if="$1" bs=4 skip="$offset" count=1 >dd.temp.txt 2>/dev/null
    certutil -encodehex dd.temp.txt certutil.temp.txt >/dev/null
    RGB=$(cat certutil.temp.txt)
    RGB=${RGB:9:9}
    RGB="${RGB// /}"
    rm dd.temp.txt
    rm certutil.temp.txt
    echo "$RGB" >&1
}
