
# Installer


## Why ?

  What ???! A new Qt is out ?!!! Raaaah ! I need to
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
  $ bash installQt.sh
  ```

  Or if you want to install a specific version of Qt on
  your computer, you might just want to specify a specific
  version as arguments to the script.

  ```shell
  $ bash installQt.sh X.Y X.Y.0
  ```
  Example :

  The following command will install the Qt 5.10 initial release
  on the machine. The different steps included are the 
  Package development, the installation of the .run file and the 
  creation of the environment variable.

  ```shell
  $ bash installQt.sh 5.10 5.10.0
  ```

## Contribute

  Your contribution can be as simple as testing that a new version of Qt works
  or by opening an issue, and sending a pull request (the pair...)
  so that I can merge it to the master branch

## Supported versions

  Currently, the following versions have been tested :

  | Qt version | Status | Command Params             |
  |------------|--------|-----------------------------
  | 5.11       | OK     | $ installQt.sh 5.11 5.11.0 |
  | 5.10       | ...    | NA                         |
  | 5.9        | OK     | $ installQt.sh 5.9 5.9.0   |
  | 5.8        | ...    | NA                         |


