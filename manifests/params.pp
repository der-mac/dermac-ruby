# == Class: ruby::params
#
# This is the paramter-class to configure the ruby language
#
# === Parameters
#
# See the init-class.
#
# === Variables
#
# === Examples
#
# === Authors
#
# Martin Schneider <martin@dermac.de>
#
# === Copyright
#
# Copyright 2017 Martin Schneider
#
class ruby::params {

  $default_package_name = ['ruby']
  $default_installpath  = 'C:\tools\ruby24'
  $package_ensure       = latest
  $prerelease           = false
  $checksum             = false
  $addtk                = true
  $assocfiles           = true
  $modpath              = true
  $defaultutf8          = true

  case $::os['name'] {
    'windows': {
      case $::os['release']['full'] {
        '7', '10': {
          $package_name = $default_package_name
          $installpath = $default_installpath
        }
        default: {
          fail("The ${module_name} module is not supported on Windows Version ${::os['release']['full']} based system.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::os['name']} based system.")
    }
  }
}
