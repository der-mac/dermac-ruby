# == Class: ruby::install
#
# This is the install-class to install the ruby language
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
class ruby::install inherits ruby {

  case $::os['name'] {
    'windows': {
      case $::os['release']['full'] {
        '7', '10': {
          # ensure chocolatey is installed and configured
          include chocolatey

          # Initialise Install-Options-Array
          $install_options_0 = []
          if ($ruby::prerelease) { $install_options_1 = concat($install_options_0, '-pre') }
          else { $install_options_1 = $install_options_0 }

          if ($ruby::checksum) { $install_options_2 = concat($install_options_1, "--download-checksum=${ruby::checksum}") }
          else { $install_options_2 = $install_options_1 }

          if ($ruby::addtk) { $addtk = ',addtk' }
          else { $addtk = '' }

          if ($ruby::assocfiles) { $assocfiles = ',assocfiles' }
          else { $assocfiles = '' }

          if ($ruby::modpath) { $modpath = ',modpath' }
          else { $modpath = '' }

          if ($ruby::defaultutf8) { $defaultutf8 = ',defaultutf8' }
          else { $defaultutf8 = '' }

          $install_options = concat($install_options_2, [
            '--install-arguments',
            '"/verysilent',
            "/dir=\"\"${ruby::installpath}\"\"",
            "/tasks=\"\"noridkinstall${addtk}${assocfiles}${modpath}${defaultutf8}\"\"\"",
            '--override-arguments'
            ])

          package { $ruby::package_name:
            ensure            => $ruby::package_ensure,
            provider          => 'chocolatey',
            install_options   => $install_options,
            uninstall_options => ['-r'],
          }
        }
        default: {
          fail("The ${module_name} module is not supported on Windows Version ${::operatingsystemmajrelease} based system.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
