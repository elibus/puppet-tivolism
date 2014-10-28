# == Class tivolism::config
#
# This class is called from tivolism
#
class tivolism::config {
  file { 'dsm.sys':
    path    => '/opt/tivoli/tsm/client/ba/bin/dsm.sys',
    ensure  => file,
    owner   => $tivolism::params::user,
    group   => $tivolism::params::group,
    mode    => '0664',
    content => template('tivoli/dsm.sys.erb')
  }

  file { 'dsm.opt':
    path    => '/opt/tivoli/tsm/client/ba/bin/dsm.opt',
    ensure  => file,
    owner   => $tivolism::params::user,
    group   => $tivolism::params::group,
    mode    => '0664',
    content => template('tivoli/dsm.opt.erb')
  }

  file { 'Inclexcl':
    path    => $Inclexcl,
    ensure  => file,
    owner   => $tivolism::params::user,
    group   => $tivolism::params::group,
    mode    => '0664',
    replace => 'no'
  }
}
