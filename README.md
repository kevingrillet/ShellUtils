# ShellUtils

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg?logo=gnu)](https://www.gnu.org/licenses/gpl-3.0)
[![Windows 10](https://img.shields.io/badge/Windows-10-blue?logo=Windows)](https://www.microsoft.com/)
[![Git Bash](https://img.shields.io/badge/Git%20Bash-git--bash.exe-orange?logo=GitHub)](https://desktop.github.com/)

Utils created for Shell

## utils.sh

```sh
# my_exec <COMMAND>
# pause
# printVerbose <MESSAGE>
```

Require `$VERBOSE` equal `true` or `false`

## utils_colors.sh

```sh
# colorDistance <COLOR1> <COLOR2>
# hexColorDelta <COLOR1> <COLOR2>
# sRGBEuclideanDistance <COLOR1> <COLOR2>
# sRGBEuclideanDistanceWeighted <COLOR1> <COLOR2>
# sRGBEuclideanDistanceRedmean <COLOR1> <COLOR2>
# sRGBLuminance <COLOR>
# sRGBLuminanceW3 <COLOR>
# sRGBLuminanceHSP <COLOR>
```

Require `utils_maths.sh`

## utils_git.sh

```sh
# get_latest_release <USER/REPO>
# get_latest_version <USER/REPO> <BRANCH> <FOLDER/FILE>
```

## utils_maths.sh

```sh
# sqrt <VALUE>
```

## utils_stdout_colors.sh

Bunch of constants colors for a prettier output.

## utils_stdout_with_colors.sh

```sh
# printError <MESSAGE>
# printInfo <MESSAGE>
# printSuccess <MESSAGE>
# printTask <MESSAGE>
# printTip <MESSAGE>
# printWarn <MESSAGE>
```

Require `utils_stdout_colors.sh`
