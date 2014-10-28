# == Class tivolism::config
#
# This class is called from tivolism
#
class tivolism::config {
  file { '/opt/tivoli/tsm/client/ba/bin/dsm.sys':
    ensure  => file,
    path    => '/opt/tivoli/tsm/client/ba/bin/dsm.sys',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('tivolism/dsm.sys.erb')
  }

  file { '/opt/tivoli/tsm/client/ba/bin/dsm.opt':
    ensure  => file,
    path    => '/opt/tivoli/tsm/client/ba/bin/dsm.opt',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('tivolism/dsm.opt.erb')
  }
}
