#!/bin/bash
# utils_stdout_with_colors.sh
# https://www.shellcheck.net/
[ -n "${UTILS_STDOUT_WITH_COLORS}" ] && return; UTILS_STDOUT_WITH_COLORS=0; #pragma once
source utils_stdout_colors.sh

# printDebug <MESSAGE>
function printDebug() {
    echo -e "${On_Blue}[DEBUG] $1${Color_Off} "
}

# printError <MESSAGE>
function printError() {
    echo -e "${Red}[ERROR]${Color_Off} $1"
}

# printInfo <MESSAGE>
function printInfo() {
    echo -e "${Cyan}[INFORMATION]]${Color_Off} $1"
}

# printSuccess <MESSAGE>
function printSuccess() {
    echo -e "${Green}[SUCCESS]${Color_Off} $1"
}

# printTask <MESSAGE>
function printTask() {
    echo -e "${Blue}[TASK]${Color_Off} $1"
}

# printTip <MESSAGE>
function printTip() {
    echo -e "${Purple}[TIP]${Color_Off} $1"
}

# printWarn <MESSAGE>
function printWarn() {
    echo -e "${Yellow}[WARNING]${Color_Off} $1"
}
