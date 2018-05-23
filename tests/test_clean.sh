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
function test_cleanup() {

   setup
   if [ ! -d Qt ]; then 
      echo "   Qt ------------ Pass"
   else
      echo "   Qt ------------ Fail"
      exit 1
   fi
   if [ ! -f qt-opensource-linux-x64-*.run ]; then
      echo "   .run ---------- Pass"
   else
      echo "   .run ---------- Fail"
      exit 1
   fi
   if [ ! -f qt-*.env ]; then
      echo "   .env ---------- Pass"
   else
      echo "   .env ---------- Fail"
      exit 1
   fi
   teardown
}

test_cleanup
