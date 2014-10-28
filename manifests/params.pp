# == Class tivolism::params
#
# This class is meant to be called from tivolism
# It sets variables according to platform
#
class tivolism::params (
  $TCPSERVERADDRESS = undef,
  $Inclexcl = undef,
  $package_name = undef,
  $deps = undef,
  $additional_packages = undef,
  $service_name = 'dsmc-sched',
  $COMMMETHOD = 'TCPIP',
  $TCPPORT = '1500',
  $TCPNODELAY = 'YES',
  $TCPCLIENTPORT ='1501',
  $SCHEDLOGRETENTION = '8',
  $PASSWORDACCESS = 'GENERATE',
  $ERRORLOGRETENTION = '8',
  $ERRORLOGNAME = "/var/log/${::hostname}.adsmerr.log",
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
      #$service_name = 'TIVsm-'
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
    default: {
      fail("${::architecture} architecture not supported")
    }
  }
}
