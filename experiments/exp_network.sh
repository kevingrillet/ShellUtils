#!/bin/bash
# ##############################################################################
# Script Name   : exp_network.sh
# Description   : Experiment around network
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# ##############################################################################

# speed_download The average download speed that curl measured for the complete download. Bytes per second.

echo "Trying to download maximum out of 10G in 10s"
output10G=$(curl -s --max-time 10 -4 -o /dev/null https://bouygues.testdebit.info/10G.iso -w "%{speed_download}")
echo "Average speed: $(numfmt --to=iec "$output10G")/s"
echo

echo "Trying to download maximum out of 1G in 10s"
output1G=$(curl -s --max-time 10 -4 -o /dev/null https://bouygues.testdebit.info/1G.iso -w "%{speed_download}")
echo "Average speed: $(numfmt --to=iec "$output1G")/s"
echo

echo "Trying to download maximum out of 100M in 10s"
output100M=$(curl -s --max-time 10 -4 -o /dev/null https://bouygues.testdebit.info/100M.iso -w "%{speed_download}")
echo "Average speed: $(numfmt --to=iec "$output100M")/s"
