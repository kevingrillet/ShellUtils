#!/bin/bash
# ##############################################################################
# Script Name   : exp_test.sh
# Description   : Experiment around Test
# Author        : Kevin GRILLET
# GitHub        : https://github.com/kevingrillet/ShellUtils
# License       : GNU GPL-3
# ##############################################################################

var=5

# ##############################################################################
# Function Name : testOR
# Description   : test OR implementation
# Args          : <VALUE> [<VALUE>]
# Output        : return 0/1
# ##############################################################################
testOR() {
    for arg in "$@"; do
        shift
        if [ "$var" = "$arg" ]; then return 0; fi
    done
    return 1;
}

# ##############################################################################
# Function Name : testORbis
# Description   : Coll test OR minus first arg
# Args          : <USELESS> <VALUE> [<VALUE>]
# Output        : return 0/1
# ##############################################################################
testORbis() {
    # testOR "${@:2}"                           # Not sh friendly...
    shift
    testOR "$@"
}

# ##############################################################################
# Function Name : testNAND
# Description   : test NAND implementation
# Args          : <VALUE> [<VALUE>]
# Output        : return 0/1
# ##############################################################################
testNAND() {
    for arg in "$@"; do
        shift
        if [ "$var" = "$arg" ]; then return 1; fi
    done
    return 0;
}

# ##############################################################################
# Function Name : testNANDbis
# Description   : Coll test NAND minus first arg
# Args          : <USELESS> <VALUE> [<VALUE>]
# Output        : return 0/1
# ##############################################################################
testNANDbis() {
    # testNAND "${@:2}"                         # Not sh friendly...
    shift
    testNAND "$@"
}

echo "Test OR"
if [ "$var" = 0 ]; then echo "Test 1: OK"; fi                                   # Output:
if testOR 0; then echo "Test 2: OK"; fi                                         # Output:
if [ "$var" = 5 ]; then echo "Test 3: OK"; fi                                   # Output: Ok
if testOR 5; then echo "Test 4: OK"; fi                                         # Output: Ok
if [ "$var" = 0 ] || [ "$var" = 1 ]; then echo "Test 5: OK"; fi                 # Output:
if testOR 0 1; then echo "Test 6: OK"; fi                                       # Output:
if [ "$var" = 0 ] || [ "$var" = 5 ]; then echo "Test 7: OK"; fi                 # Output: Ok
if testOR 0 5; then echo "Test 8: OK"; fi                                       # Output: Ok
if testORbis Lorem 0 1; then echo "Test 9: OK"; fi                              # Output:
if testORbis Lorem 0 5; then echo "Test 10: OK"; fi                             # Output: Ok

echo "Test NAND"
if [ "$var" != 0 ]; then echo "Test 1: OK"; fi                                  # Output: Ok
if testNAND 0; then echo "Test 2: OK"; fi                                       # Output: Ok
if [ "$var" != 5 ]; then echo "Test 3: OK"; fi                                  # Output:
if testNAND 5; then echo "Test 4: OK"; fi                                       # Output:
if [ "$var" != 0 ] && [ "$var" != 1 ]; then echo "Test 5: OK"; fi               # Output: Ok
if testNAND 0 1; then echo "Test 6: OK"; fi                                     # Output: Ok
if [ "$var" != 0 ] && [ "$var" != 5 ]; then echo "Test 7: OK"; fi               # Output:
if testNAND 0 5; then echo "Test 8: OK"; fi                                     # Output:
if testNANDbis Lorem 0 1; then echo "Test 9: OK"; fi                            # Output: Ok
if testNANDbis Lorem 0 5; then echo "Test 10: OK"; fi                           # Output:
