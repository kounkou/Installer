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
function test_install() {
   
   if [ ! -d Qt/Tools ]; then
      echo "   Qt/Tools ------ Pass"
   else
      echo "   Qt/Tools ------ Fail"
      exit 1
   fi
}

test_install
