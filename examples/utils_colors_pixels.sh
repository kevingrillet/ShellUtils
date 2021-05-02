#!/bin/bash
# ##############################################################################
# Script Name   : utils_colors_pixels.sh
# Description   : Demo of utils_colors_pixels.sh
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# Require       : utils_colors_pixels.sh
# ##############################################################################
. ../utils/utils_colors_pixels.sh

# Not working
getRGBFromImagePixel "images/bmp/black.bmp" 16 16
getRGBFromImagePixel "images/jpg/black.jpg" 16 16
getRGBFromImagePixel "images/png/black.png" 16 16
