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

   setup
   # Some important binaries qmake, linguist, designer
   if [ -f Qt/components.xml ]; then 
      echo "   install ------- Pass"
   else
      echo "   install ------- Fail"
      exit 1
   fi
   teardown
}

test_install
