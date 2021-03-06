# == Class: tivolism
#
# tivolism install and configure Tivoli Storage Manager for Linux
#
# === Parameters
#
# [*tcpserveraddress*]
#   Tivoli Storage Manager Server IP
# [*package_name*]
#   Array of packages to be installed
# [*deps*]
#   Array of dependency packages to be installed
# [*service_name*]
#   Service to be kept up & running (default: dsmcad)
# [*other*]
#   Tivoli Storage Manager related params. See IBM docs
#
class tivolism (
  $tcpserveraddress = $tivolism::params::tcpserveraddress,
  $package_name = $tivolism::params::package_name,
  $deps = $tivolism::params::deps,
  $additional_packages = $tivolism::params::additional_packages,
  $service_name = $tivolism::params::service_name,
  $commmethod = $tivolism::params::commmethod,
  $tcpport = $tivolism::params::tcpport,
  $tcpnodelay = $tivolism::params::tcpnodelay,
  $tcpclientport = $tivolism::params::tcpclientport,
  $schedlogretention = $tivolism::params::schedlogretention,
  $passwordaccess = $tivolism::params::passwordaccess,
  $errorlogretention = $tivolism::params::errorlogretention,
  $errorlogname = $tivolism::params::errorlogname,
  $tcpbuffsize = $tivolism::params::tcpbuffsize,
  $tcpwindowsize = $tivolism::params::tcpwindowsize,
  $tcpnodelay = $tivolism::params::tcpnodelay,
  $txnbytelimit = $tivolism::params::txnbytelimit,
  $largecommbuffers = $tivolism::params::largecommbuffers,
  $schedlogname = $tivolism::params::schedlogname,
  $schedmode = $tivolism::params::schedmode,
) inherits tivolism::params {

  # validate parameters here
  validate_string($tcpserveraddress)
  validate_array($package_name)
  validate_array($deps)
  validate_array($additional_packages)
  validate_string($service_name)
  validate_string($commmethod)
  validate_re($tcpport, '\d+')
  validate_string($tcpnodelay)
  validate_re($tcpclientport, '\d+')
  validate_string($schedlogretention)
  validate_string($passwordaccess)
  validate_string($errorlogretention)
  validate_absolute_path($errorlogname)
  validate_re($tcpbuffsize, '\d+')
  validate_re($tcpwindowsize, '\d+')
  validate_string($tcpnodelay)
  validate_re($txnbytelimit, '\d+')
  validate_string($largecommbuffers)
  validate_string($schedlogname)
  validate_string($schedmode)

  class { 'tivolism::install': } ->
  class { 'tivolism::config': } ~>
  class { 'tivolism::service': } ->
  Class['tivolism']
}


