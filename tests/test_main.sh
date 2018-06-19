#!/bin/bash

set -e

# 
# Perform a soft clean up of all the previous installation files.
# This includes the :
#    - Symbolic link
#    - Qt directory
#    - environment files

#######################################
# This test script uses a hashmap in bash (Yeah !)
# to be able to test for each version of Qt
# Globals:
#    None
# Arguments:
#    None
# Returns:
#    None
#######################################
function test_main() {

   declare -A hmap=([0]="./installQt.sh 5.11 5.11.1" \
                    [1]="./installQt.sh 5.10 5.10.1" \
                    [2]="./installQt.sh 5.9  5.9.5"  \
                    [3]="./installQt.sh 5.8  5.8.0"  \
                    [4]="./installQt.sh 5.7  5.7.1"  \
                    [5]="./installQt.sh 5.6  5.6.3"  \
                    [6]="./installQt.sh 5.5  5.5.1"  \
                   )
   echo # prints a nl 

   for qt_version in $(seq 0 ${#hmap[@]}); do
      eval "${hmap[$qt_version]}"
      ./test_install.sh
      ./cleanup.sh
      ./test_clean.sh
   done
}

test_main
