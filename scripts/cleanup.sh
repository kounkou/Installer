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
function cleanup() {

   rm -rf Qt qt-opensource-linux-x64-*.run qt-*.env 
}

cleanup
