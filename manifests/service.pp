# == Class tivolism::service
#
# This class is meant to be called from tivolism
# It ensure the service is running
#
class tivolism::service {

  service { $tivolism::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
