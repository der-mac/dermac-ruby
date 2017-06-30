# == Class: ruby
#
# Install and configure the ruby language (https://www.ruby-lang.org/).
#
# === Parameters
#
# [*package_ensure*]
#   One of the following values
#   installed|latest|'1.0.0'|absent
# [*$package_name*]
#   Name of the package in the operatingsystem, or in case of Windows
#   the packagename in chocolatey
# [*$prerelease*]
#   If supported you can install a prerelease
#   (for example on windows/chocolatey an uploaded but not approved version)
#   true|false
# [*$checksum*]
#   If supported you can overwrite the checksum of the downloaded file
#   (for example on windows/chocolatey you can overwrite the checksum
#   provided by the maintainer)
#
# === Variables
#
# === Examples
#
#  class { 'ruby': }
#
# === Authors
#
# Martin Schneider <martin@dermac.de>
#
# === Copyright
#
# Copyright 2017 Martin Schneider
#
class ruby (
  $package_ensure = $ruby::params::package_ensure,
  $package_name   = $ruby::params::package_name,
  $prerelease     = $ruby::params::prerelease,
  $checksum       = $ruby::params::checksum,
  $addtk          = $ruby::params::addtk,
  $assocfiles     = $ruby::params::assocfiles,
  $modpath        = $ruby::params::modpath,
  $defaultutf8    = $ruby::params::defaultutf8,
  $installpath    = $ruby::params::installpath,
) inherits ruby::params {

  validate_array($package_name)
  validate_bool($prerelease)
  validate_bool($addtk)
  validate_bool($assocfiles)
  validate_bool($modpath)
  validate_bool($defaultutf8)
  validate_absolute_path($installpath)

  anchor { 'ruby::begin': }
  -> class { '::ruby::install': }
  -> class { '::ruby::config': }
  anchor { 'ruby::end': }
}
