# == Class tivolism::params
#
# This class is meant to be called from tivolism
# It sets variables according to platform
#
class tivolism::params (
  $tcpserveraddress = undef,
  $inclexcl = undef,
  $additional_packages = [],
  $service_name = 'tivolism',
  $commmethod = 'TCPIP',
  $tcpport = '1500',
  $tcpnodelay = 'YES',
  $tcpclientport ='1501',
  $schedlogretention = '8',
  $passwordaccess = 'GENERATE',
  $errorlogretention = '8',
  $errorlogname = "/var/log/${::hostname}.adsmerr.log",
  $tcpbuffsize = '32',
  $tcpwindowsize = '220',
  $tcpnodelay = 'yes',
  $txnbytelimit = '25600',
  $largecommbuffers = 'yes',
  $schedlogname = '/dev/null',
  $schedmode = 'prompt',
  $group  = 'root',
  $owner  = 'root',
  #$enable_dsmc_sched =
) {

  case $::osfamily {
    'RedHat': {
      $package_name = [ 'TIVsm-API64', 'TIVsm-BA' ]
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  case $::architecture {
    'x86_64': {
      $deps = [
        'libstdc++.x86_64',
        'libstdc++.i686',
        'compat-libstdc++.x86_64',
        'compat-libstdc++.i686'
      ]
    }
    'i686': {
      $deps = [
        'libstdc++.i686',
        'compat-libstdc++.i686'
      ]
    }
    default: {
      fail("${::architecture} architecture not supported")
    }
  }
}
