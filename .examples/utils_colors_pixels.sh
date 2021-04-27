#!/bin/bash
# ./.examples/utils_colors_pixels.sh
# https://www.shellcheck.net/
source ../utils/utils_colors_pixels.sh

# Not working
getRGBFromImagePixel "images/bmp/black.bmp" 16 16
getRGBFromImagePixel "images/jpg/black.jpg" 16 16
getRGBFromImagePixel "images/png/black.png" 16 16
