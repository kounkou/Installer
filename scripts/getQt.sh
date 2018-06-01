#!/bin/bash

set -e

#
# Download the specified Qt version from the web and call 
# the Qt extractor

QT_VERSION=$1
QT_MAJ_MIN=$2

# Global variables
QT_ROOT="https://download.qt.io/archive/qt"
QT_LINK="$QT_ROOT/$QT_MAJ_MIN/$QT_VERSION/$QT_EXE"
QT_EXE="qt-opensource-linux-x64-${QT_VERSION}.run"

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
function extractQt() {

   INSTALLER="qt-opensource-linux-x64-${QT_VERSION}.run"
   ENVFILE="qt-${QT_MAJ_MIN}.env"

   ./extractQt.sh "$PWD/$QT_EXE" "$PWD/Qt"

   echo Create $ENVFILE in $PWD
   cat << EOF > $ENVFILE
   export PATH="$PWD/Qt/${QT_MAJ_MIN}/gcc_64/bin:$PATH"
EOF
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
function downloadQt() {

   if [ ! -f ~/repo/${QT_EXE} ]; then
      echo "$QT_ROOT/${QT_MAJ_MIN}/${QT_VERSION}/$QT_EXE"
      wget -P ~/repo -c $QT_LINK
   fi
   
   if [ ! -L $QT_EXE ]; then
      ln -s ~/repo/$QT_EXE $QT_EXE
   fi
}

downloadQt
extractQt

