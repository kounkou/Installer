#!/bin/bash

set -e

#
# Download the specified Qt version from the web and call 
# the Qt extractor

QT_VERSION=$1
QT_MAJ_MIN=$2
INSTALLER="qt-opensource-linux-x64-${QT_VERSION}.run"

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

   ENVFILE="qt-${QT_MAJ_MIN}.env"

   ./extractQt.sh "$PWD/$INSTALLER" "$PWD/Qt"

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

   if [ ! -f ~/repo/"${INSTALLER}" ]; then
      echo "https://download.qt.io/archive/qt/${QT_MAJ_MIN}/${QT_VERSION}/qt-opensource-linux-x64-${QT_VERSION}.run"
      wget -P ~/repo -c "https://download.qt.io/archive/qt/${QT_MAJ_MIN}/${QT_VERSION}/qt-opensource-linux-x64-${QT_VERSION}.run"
   fi
   
   if [ ! -L "qt-opensource-linux-x64-${QT_VERSION}.run" ]; then
      ln -s ~/repo/"qt-opensource-linux-x64-${QT_VERSION}.run" "qt-opensource-linux-x64-${QT_VERSION}.run"
   fi
}

downloadQt
extractQt

