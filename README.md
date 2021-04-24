# ShellUtils

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg?logo=gnu)](https://www.gnu.org/licenses/gpl-3.0)
[![Windows 10](https://img.shields.io/badge/Windows-10-blue?logo=Windows)](https://www.microsoft.com/)
[![Git Bash](https://img.shields.io/badge/Git%20Bash-git--bash.exe-orange?logo=GitHub)](https://desktop.github.com/)

Utils created for Shell.

Every script will be include one time: [`#pragma once`](https://stackoverflow.com/a/58510109/7295428)

Examples can be found in `.examples`

## [utils.sh](./utils/utils.sh)

```shell
# execDebug <COMMAND>
# execVerbose <COMMAND>
# pause
# printVerbose <MESSAGE>
```

Require `$DEBUG` equal `true` or `false`

Require `$VERBOSE` equal `true` or `false`

## [utils_colors.sh](./utils/utils_colors.sh)

```shell
# sRGBColorDelta <COLOR1> <COLOR2>
# sRGBColorDistance <COLOR1> <COLOR2>
# sRGBEuclideanDistance <COLOR1> <COLOR2>
# sRGBEuclideanDistanceWeighted <COLOR1> <COLOR2>
# sRGBEuclideanDistanceRedmean <COLOR1> <COLOR2>
# sRGBExtractColor <COLOR> <R/G/B>
# sRGBLuminance <COLOR>
# sRGBLuminanceW3 <COLOR>
# sRGBLuminanceHSP <COLOR>
```

Require [`utils_maths.sh`](./utils/utils_maths.sh)

## [utils_git.sh](./utils/utils_git.sh)

```shell
# get_latest_release <USER/REPO>
# get_latest_version <USER/REPO> <BRANCH> <FOLDER/FILE>
```

## [utils_maths.sh](./utils/utils_maths.sh)

```shell
# abs <VALUE>
# convertHexToDec <VALUE>
# pow <BASE> <EXPONENT>
# randomInt
# randomIntRange <LOWER> <UPPER>
# sqrt <VALUE>
```

## [utils_stdout_colors.sh](./utils/utils_stdout_colors.sh)

Bunch of constants colors for a prettier output.

## [utils_stdout_with_colors.sh](./utils/utils_stdout_with_colors.sh)

```shell
# printDebug <MESSAGE>
# printError <MESSAGE>
# printInfo <MESSAGE>
# printSuccess <MESSAGE>
# printTask <MESSAGE>
# printTip <MESSAGE>
# printWarn <MESSAGE>
```

Require [`utils_stdout_colors.sh`](./utils/utils_stdout_colors.sh)
