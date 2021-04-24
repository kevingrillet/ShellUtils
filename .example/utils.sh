#!/bin/bash
# ./.example/utils.sh
# https://www.shellcheck.net/
source ../utils/utils.sh
source ../utils/utils_stdout_colors.sh;
source ../utils/utils_stdout_with_colors.sh

execDebug
DEBUG=true
execDebug printDebug "Lorem ipsum dolor sit amet"
DEBUG=false
execDebug printDebug "Lorem ipsum dolor sit amet"

execVerbose
VERBOSE=true
execVerbose printDebug "Lorem ipsum dolor sit amet"
VERBOSE=false
execVerbose printDebug "Lorem ipsum dolor sit amet"

pause

execVerbose
VERBOSE=true
printVerbose "Lorem ipsum dolor sit amet"
VERBOSE=false
printVerbose "Lorem ipsum dolor sit amet"
