#!/bin/bash
# ./examples/utils.sh
. ../utils/utils.sh
. ../utils/utils_stdout_colors.sh;
. ../utils/utils_stdout_with_colors.sh

execDebug
DEBUG=1; execDebug printDebug "Lorem ipsum dolor sit amet"
DEBUG=0; execDebug printDebug "Lorem ipsum dolor sit amet"

execVerbose
VERBOSE=1; execVerbose printDebug "Lorem ipsum dolor sit amet"
VERBOSE=0; execVerbose printDebug "Lorem ipsum dolor sit amet"

pause

execVerbose
VERBOSE=1; printVerbose "Lorem ipsum dolor sit amet"
VERBOSE=0; printVerbose "Lorem ipsum dolor sit amet"
