#!/bin/bash

set -e

# 
# Perform the installation of the Qt version specified as
# parameter or install the last version
# The version is the last tested one.

QT_MAJ_MIN="${1:-5.11}"
QT_VERSION="${2:-5.11.0}"
CMAKE_VERSION=`cmake --version | grep version | awk '{ print $3 }'`

#######################################
# Simple function to print the different 
# versions for installation.
# Globals:
#    QT_MAJ_MIN
#    QT_VERSION
#    CMAKE_VERSION
# Arguments:
#    None
# Returns:
#    None
#######################################
function displayDependencies() {

   echo "Given version for QT_MAJ_MIN : $QT_MAJ_MIN"
   echo "Given version for QT_VERSION : $QT_VERSION"
   echo "Given version for CMAKE      : $CMAKE_VERSION"
}

#######################################
# Installing Qt might require some dependencies
# Call this function to install those
# An idea might be to create a configuration file
# and install dependencies from the config given
# Globals:
#    QT_MAJ_MIN
#    QT_VERSION
#    CMAKE_VERSION
# Arguments:
#    None
# Returns:
#    None
#######################################
function installDependencies() {
   
   # if [ ! -z $CMAKE_VERSION ]; then
   #    echo 'Installing CMake...'
   #    sudo apt-get install --yes cmake
   # fi
   return 0
}

#######################################
# This part will perform the actuall installation of Qt
# Globals:
#    QT_MAJ_MIN
#    QT_VERSION
#    CMAKE_VERSION
# Arguments:
#    None
# Returns:
#    None
#######################################
function performInstall() {
   local current_dir=$PWD
   local flag=0

   if [ -d scripts ]; then
      cd scripts
      flag=1
   fi
   if [ -f getQt.sh ]; then
      ./getQt.sh ${QT_VERSION} ${QT_MAJ_MIN}
   else
      echo "Your automatic installer is corrupted !"
      exit 0
   fi
   if [ flag == 1 ]; then
      cd ${current_dir}
   fi
}

sudo apt-get install curl
sudo apt-get install libgl-dev

displayDependencies
performInstall

