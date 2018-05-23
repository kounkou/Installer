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

   # Some important binaries qmake, linguist, designer
   if [ -f Qt/*/gcc_64/bin/qmake ]; then 
      echo "   qmake --------- Pass"
   else
      echo "   qmake --------- Fail"
      exit 1
   fi
   if [ -f Qt/*/gcc_64/bin/linguist ]; then 
      echo "   linguist ------ Pass"
   else
      echo "   linguist ------ Fail"
      exit 1
   fi
   if [ -f Qt/*/gcc_64/bin/designer ]; then 
      echo "   designer ------ Pass"
   else
      echo "   designer ------ Fail"
      exit 1
   fi

   # Root arborescence
   if [ -d Qt/Tools ]; then 
      echo "   Tools --------- Pass"
   else
      echo "   Tools --------- Fail"
      exit 1
   fi
   if [ -d Qt/Licenses ]; then 
      echo "   Licences ------ Pass"
   else
      echo "   Licences ------ Fail"
      exit 1
   fi
   if [ -d Qt/Tools ]; then 
      echo "   Dist ---------- Pass"
   else
      echo "   Dist ---------- Fail"
      exit 1
   fi
   teardown
}

test_cleanup
