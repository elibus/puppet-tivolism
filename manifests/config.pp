# == Class tivolism::config
#
# This class is called from tivolism
#
class tivolism::config {
  file { '/opt/tivoli/tsm/client/ba/bin/dsm.sys':
    path    => '/opt/tivoli/tsm/client/ba/bin/dsm.sys',
    ensure  => file,
    owner   => $tivolism::user,
    group   => $tivolism::group,
    mode    => '0664',
    content => template('tivolism/dsm.sys.erb')
  }

  file { '/opt/tivoli/tsm/client/ba/bin/dsm.opt':
    path    => '/opt/tivoli/tsm/client/ba/bin/dsm.opt',
    ensure  => file,
    owner   => $tivolism::user,
    group   => $tivolism::group,
    mode    => '0664',
    content => template('tivolism/dsm.opt.erb')
  }

  file { $tivolism::inclexcl:
    path    => $tivolism::inclexcl,
    ensure  => file,
    owner   => $tivolism::user,
    group   => $tivolism::group,
    mode    => '0664',
    replace => 'no'
  }
}
