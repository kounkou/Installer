#!/bin/bash

set -e

#
# Download the specified Qt version from the web and call 
# the Qt extractor

QT_VERSION=$1
QT_MAJ_MIN=$2
INSTALLER="qt-opensource-linux-x64-${QT_VERSION}.run"
WEB_SITE="https://download.qt.io/archive/qt"

#######################################
function checkRemoteFile() {
   local status=$(curl --head --silent "${WEB_SITE}/${QT_MAJ_MIN}/${QT_VERSION}/${INSTALLER}" | head -n 1)
   local result=`echo "${status}" | grep -q 404`
   
   if [ "${result}" != "" ]; then
      echo "File exists..."
   else
      echo "File ${WEB_SITE}/${QT_MAJ_MIN}/${QT_VERSION}/${INSTALLER} doesn't exist"
      exit 1
   fi
}

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
function downloadQt() {

   checkRemoteFile
   
   if [ ! -f ~/repo/"${INSTALLER}" ]; then
      echo "${WEB_SITE}/${QT_MAJ_MIN}/${QT_VERSION}/${INSTALLER}"
      wget -P ~/repo -c "${WEB_SITE}/${QT_MAJ_MIN}/${QT_VERSION}/${INSTALLER}"
   fi
   
   if [ ! -L "${INSTALLER}" ]; then
      ln -s ~/repo/"${INSTALLER}" "${INSTALLER}"
   fi
}

downloadQt
extractQt

