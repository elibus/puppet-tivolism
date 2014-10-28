# == Class tivolism::install
#
class tivolism::install {

  package { $tivolism::package_name:
    ensure => present,
  }

  ensure_packages($tivolism::params::deps, {
      ensure => present
    }
  )

  ensure_packages($tivolism::params::additional_packages, {
      ensure => present
    }
  )
}
