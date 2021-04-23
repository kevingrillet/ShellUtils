#!/bin/bash
# https://www.shellcheck.net/
source utils_stdout_colors.sh

# printError <MESSAGE>
function printError() {
    echo -e "${Red}Error:${Color_Off} $1"
}

# printInfo <MESSAGE>
function printInfo() {
    echo -e "${Cyan}Info:${Color_Off} $1"
}

# printSuccess <MESSAGE>
function printSuccess() {
    echo -e "${Green}Success:${Color_Off} $1"
}

# printTask <MESSAGE>
function printTask() {
    echo -e "${Blue}Task:${Color_Off} $1"
}

# printTip <MESSAGE>
function printTip() {
    echo -e "${Purple}Tip:${Color_Off} $1"
}

# printWarn <MESSAGE>
function printWarn() {
    echo -e "${Yellow}Warning:${Color_Off} $1"
}
