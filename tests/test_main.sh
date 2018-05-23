#!/bin/bash

set -e

# 
# Perform a soft clean up of all the previous installation files.
# This includes the :
#    - Symbolic link
#    - Qt directory
#    - environment files

#######################################
# Performs a cleanup on the files used
# during the previous installation
# Globals:
#    None
# Arguments:
#    None
# Returns:
#    None
#######################################
function test_main() {

   declare -A hmap=([0]="./installQt.sh 5.11 5.11.0" \
                    [1]="./installQt.sh 5.10 5.10.1" \
                    [2]="./installQt.sh 5.9  5.9.5"  \
                    [3]="./installQt.sh 5.8  5.8.0"  \
                    [4]="./installQt.sh 5.7  5.7.1"  \
                    [5]="./installQt.sh 5.6  5.6.3"  \
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
