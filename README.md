
[![Build Status](https://travis-ci.com/kounkou/Installer.svg?branch=master)](https://travis-ci.com/kounkou/Installer)

# Installer


## Why ?

  What ?! A new Qt is out ?! Raaaah... I need to
  download that new version, and reinstall my rig with the newest version
  This is gonna take me all the night long again...
  Yeah... Installing Qt can take long hours and require you to 
  know how to install how to configure the modules and
  where to find all the binaries.
  Because I am myself a so lazy (yeah, I know you are :-), 
  I created Installer to ease the transition from one
  version of Qt to another version smoothly. Just launch the install.

## Install and example

  Installer can be called with 0 or 2 parameters.
  When called with 0 parameter, Installer will default the
  installation to the last (Stable or Unstable) version of Qt.
  You can call installer the following way

  ```shell
  $ git clone https://github.com/kounkou/Installer.git
  $ cd Installer
  $ cd scripts
  $ bash installQt.sh
  ```

  Or if you want to install a specific version of Qt on
  your computer, you might just want to specify a specific
  version as arguments to the script.

  ```shell
  $ git clone https://github.com/kounkou/Installer.git
  $ cd Installer
  $ cd scripts
  $ bash installQt.sh X.Y X.Y.0
  ```
  Example :

  The following command will install the Qt 5.10 initial release
  on the machine. The different steps included are the 
  Package development, the installation of the .run file and the 
  creation of the environment variable.

  ```shell
  $ git clone https://github.com/kounkou/Installer.git
  $ cd Installer
  $ cd scripts
  $ bash installQt.sh 5.10 5.10.0
  ```
  
## Launch Qt

   To launch Qt creator, from the scripts directory, use the following commands
   to navigate to the Qtcreator directory
   
   ```shell
   $ cd Qt/Tools/QtCreator/bin/
   $ ./qtcreator
   ```

## Note

   Please note that Installer keeps a repository of offline .run files.
   You might just want to remove those you don't want to reinstall this soon.
   The repository is located on your home directory with the name 'repo'

## Contribute

  Your contribution can be as simple as testing that a new version of Qt works
  or by opening an issue, and sending a pull request (the pair...)
  so that I can merge it to the master branch

## Supported versions

  Currently, the following versions have been tested :

  | Qt version | Status |
  |------------|--------|
  | 5.11.1     | [![Build Status](https://travis-ci.com/kounkou/Installer.svg?branch=master)](https://travis-ci.com/kounkou/Installer)|
  | 5.10.1     | [![Build Status](https://travis-ci.com/kounkou/Installer.svg?branch=master)](https://travis-ci.com/kounkou/Installer)|
  | 5.9.5      | [![Build Status](https://travis-ci.com/kounkou/Installer.svg?branch=master)](https://travis-ci.com/kounkou/Installer)|
  | 5.8.0      | [![Build Status](https://travis-ci.com/kounkou/Installer.svg?branch=master)](https://travis-ci.com/kounkou/Installer)|
  | 5.7.1      | [![Build Status](https://travis-ci.com/kounkou/Installer.svg?branch=master)](https://travis-ci.com/kounkou/Installer)|
  | 5.6.3      | [![Build Status](https://travis-ci.com/kounkou/Installer.svg?branch=master)](https://travis-ci.com/kounkou/Installer)|
  | 5.5.1      | [![Build Status](https://travis-ci.com/kounkou/Installer.svg?branch=master)](https://travis-ci.com/kounkou/Installer)|

