#!/bin/bash

set -e

SCRIPTS="../scripts"
TESTS=${PWD}

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
function setup() {
  
   echo "Entering directory ${SCRIPTS}"
   cd ${SCRIPTS}
}

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
function teardown() {
   
   echo "Exiting directory  ${SCRIPTS}"
   cd ${TESTS}
}

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
function test_install() {
   
   return 0
}

test_install
