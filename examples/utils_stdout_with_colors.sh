#!/bin/bash
# ./examples/utils_stdout_with_colors.sh
. ../utils/utils_stdout_colors.sh
. ../utils/utils_stdout_with_colors.sh

printDebug
printDebug "Lorem ipsum dolor sit amet"

printError
printError "Lorem ipsum dolor sit amet"

printInfo
printInfo "Lorem ipsum dolor sit amet"

printSuccess
printSuccess "Lorem ipsum dolor sit amet"

printTask
printTask "Lorem ipsum dolor sit amet"

printTip
printTip "Lorem ipsum dolor sit amet"

printWarn
printWarn "Lorem ipsum dolor sit amet"
