# ShellUtils

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg?logo=gnu)](https://www.gnu.org/licenses/gpl-3.0)
[![Windows 10](https://img.shields.io/badge/Windows-10-blue?logo=Windows)](https://www.microsoft.com/)
[![Git Bash](https://img.shields.io/badge/Git%20Bash-v4.4.23-orange?logo=GitHub)](https://desktop.github.com/)
[![macOS](https://img.shields.io/badge/macOS-Catalina-white?logo=macOS)](https://www.microsoft.com/)
[![Bash](https://img.shields.io/badge/Bash-v3.2.57-black?logo=Windows-Terminal)](https://desktop.github.com/)

Utils created for Shell. My objective is to have utils running on my PC with `Git Bash` and on my Mac with this [older version](https://itnext.io/upgrading-bash-on-macos-7138bd1066ba) of `Bash`.

Every script will be include one time: [`#pragma once`](https://stackoverflow.com/a/58510109/7295428).

Examples can be found in `examples` folder.

You can also find some `experiments` on more precise shell things.

## [utils.sh](./utils/utils.sh)

```shell
# execDebug <COMMAND>
# execVerbose <COMMAND>
# pause
# printVerbose <MESSAGE>
```

Require `DEBUG` and `VERBOSE` as integer (default: `0`).

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

Require [`utils_maths.sh`](./utils/utils_maths.sh).

## [utils_git.sh](./utils/utils_git.sh)

```shell
# get_latest_release <USER/REPO>
# get_latest_version <USER/REPO> <BRANCH> <FOLDER/FILE>
```

## [utils_ini.sh](./utils/utils_ini.sh)

```shell
# getIniValue <FILE> <SECTION> <PARAM> [<DEFAULT>]
# getIniValueLight <FILE> <PARAM> [<DEFAULT>]
# getIniValueLighter <FILE> <PARAM> [<DEFAULT>]
# setIniValue <FILE> <SECTION> <PARAM> <VALUE>
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

Require [`utils_stdout_colors.sh`](./utils/utils_stdout_colors.sh).
