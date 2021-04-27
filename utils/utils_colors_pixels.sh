#!/bin/bash
# ./utils/utils_colors_pixels.sh
# https://www.shellcheck.net/
[ -n "${UTILS_COLORS_PIXELS}" ] && return; UTILS_COLORS_PIXELS=0; #pragma once

# Not working
# getRGBFromImagePixel <IMAGE> <X> <Y>
getRGBFromImagePixel() {
    offset=$((DEVICEWIDTH*$3+$2+3))
#    RGB=$(dd if="$1" bs=4 skip="$offset" count=1 2>/dev/null | hexdump -C)     # hexdump not in windows Git Bash :/
    dd if="$1" bs=4 skip="$offset" count=1 >dd.temp.txt 2>/dev/null
    certutil -encodehex dd.temp.txt certutil.temp.txt
    RGB=$(cat certutil.temp.txt)
    RGB=${RGB:9:9}
    RGB="${RGB// /}"
    rm dd.temp.txt
    rm certutil.temp.txt
    echo "$RGB"
}
