# == Class: tivolism
#
# Full description of class tivolism here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class tivolism (
  $TCPSERVERADDRESS = $tivolism::params::TCPSERVERADDRESS,,
  $Inclexcl = undef,
  $package_name = $tivolism::params::package_name,
  $deps = $tivolism::params::deps,
  $service_name = $tivolism::params::service_name,
  $additional_packages = $tivolism::params::additional_packages,
  $COMMMETHOD = $tivolism::params::COMMMETHOD,
  $TCPPORT = $tivolism::params::TCPPORT,
  $TCPNODELAY = $tivolism::params::TCPNODELAY,
  $TCPCLIENTPORT = $tivolism::params::TCPCLIENTPORT,
  $SCHEDLOGRETENTION = $tivolism::params::SCHEDLOGRETENTION,
  $PASSWORDACCESS = $tivolism::params::PASSWORDACCESS,
  $ERRORLOGRETENTION = $tivolism::params::ERRORLOGRETENTION,
  $ERRORLOGNAME = $tivolism::params::ERRORLOGNAME,
  $tcpbuffsize = $tivolism::params::tcpbuffsize,
  $tcpwindowsize = $tivolism::params::tcpwindowsize,
  $tcpnodelay = $tivolism::params::tcpnodelay,
  $txnbytelimit = $tivolism::params::txnbytelimit,
  $largecommbuffers = $tivolism::params::largecommbuffers,
  $schedlogname = $tivolism::params::schedlogname,
  $schedmode = $tivolism::params::schedmode,
  $group  = $tivolism::params::group,
  $owner  = '$tivolism::params::user,

) inherits tivolism::params {

  # validate parameters here
  validate_absolute_path($Inclexcl)
  validate_string($TCPSERVERADDRESS)
  validate_string($COMMMETHOD)
  validate_re($TCPPORT, '\d+')
  validate_string($TCPNODELAY)
  validate_re($TCPCLIENTPORT, '\d+')
  validate_string($SCHEDLOGRETENTION)
  validate_string($PASSWORDACCESS)
  validate_string($ERRORLOGRETENTION)
  validate_absolute_path($ERRORLOGNAME)
  validate_re($tcpbuffsize, '\d+')
  validate_re($tcpwindowsize, '\d+')
  validate_string($tcpnodelay)
  validate_re($txnbytelimit, '\d+')
  validate_string($largecommbuffers)
  validate_string($schedlogname)
  validate_string($schedmode)
  validate_string($owner)
  validate_string($group)
  #validate_bool($enable_dsmc_sched)

  class { 'tivolism::install': } ->
  class { 'tivolism::config': } ~>
  class { 'tivolism::service': } ->
  Class['tivolism']
}
