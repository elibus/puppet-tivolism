# == Class tivolism::config
#
# This class is called from tivolism
#
class tivolism::config {

  concat { '/opt/tivoli/tsm/client/ba/bin/dsm.sys':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  concat::fragment { 'dms.sys default':
    target  => '/opt/tivoli/tsm/client/ba/bin/dsm.sys',
    content => template('tivolism/dsm.sys.erb'),
    order   => '01'
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
