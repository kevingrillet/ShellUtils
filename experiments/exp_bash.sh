#!/bin/bash
# ./experiments/exp_bash.sh

bash --version                                  # Check bash version
dos2unix ../*/*.sh                              # Reformat all .sh files: CR + LF => LF
chmod -v +x ../*/*.sh                           # chmod +x all .sh files
