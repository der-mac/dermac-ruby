# Ruby-language module for puppet

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with ruby](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ruby](#beginning-with-ruby)
4. [Limitations](#limitations)

## Overview

The ruby-module installs the Ruby language

## Module Description

The ruby-module installs the Ruby language on Windows with the chocolatey-module in silent mode.

## Setup

### Setup Requirements

The ruby-module uses the chocolatey-chocolatey module

### Beginning with ruby

for a simple ruby-installation use:

```puppet
    class { "ruby" :
    }
```

##### `package_ensure`
One of the following values:
 * **installed:** Installs the current version
 * **latest:** Installs the current version and updates to every new release
 * **'1.0.0':** Installs a specific version
 * **absent:** Removes the application

##### `package_name`
Name of the package in the os-specific package-manager.
In normal circumstances there is no need to change this value.

##### `prerelease`
Wether or not using the prerelease of the package.
This is not available in all providers.

##### `checksum`
Override the maintainer-provided checksum for the package.
This is not available in all providers.

##### `installpath`
The abolute path, where ruby should be installed.
The default points to **C:\tools\ruby24**

##### `addtk`
With this swtich you can decide to install the optionaly Tcl/Tk support.
**true** |false

##### `assocfiles`
Associate .rb and .rbw files to the newly installed ruby.
**true** |false

##### `modpath`
Update the PATH environment variable for ruby binary.
**true** |false

##### `defaultutf8`
Set environment variable RUBYOPT=-Eutf-8.
**true** |false


To install a specific version of ruby on Windows and override the maintainers checksum:

```puppet
  class {ruby:
    package_ensure       => latest
    prerelease           => false
    checksum             => false
    installpath          => 'C:\tools\ruby24',
    $addtk               => true
    $assocfiles          => true
    $modpath             => true
    $defaultutf8         => true
  }
```

## Limitations

At the Moment, only windows 7 and windows 10 are supported.
