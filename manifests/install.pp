# == Class tivolism::install
#
class tivolism::install {

  package { $tivolism::package_name:
    ensure => present,
  }

  ensure_packages($tivolism::deps)

  ensure_packages($tivolism::additional_packages)
}
