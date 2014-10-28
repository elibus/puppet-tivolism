# == Class tivolism::params
#
# This class is meant to be called from tivolism
# It sets variables according to platform
#
class tivolism::params (
  $tcpserveraddress = undef,
  $inclexcl = undef,
  $package_name = [ 'TIVsm-API64', 'TIVsm-BA' ],
  $deps = [
    'compat-libstdc++-33.i686',
    'compat-libstdc++-33.x86_64',
    'libstdc++.x86_64',
    'libstdc++.i686'
  ],
  $additional_packages = [],
  $service_name = 'dsmcad',
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
) {
  case $::osfamily {
    'RedHat': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
