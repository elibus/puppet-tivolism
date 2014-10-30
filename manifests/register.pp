  # used by other modules to register themselves
  define tivolism::register($content='', $order='10') {
    if $content == '' {
      $body = $name
    } else {
      $body = $content
    }

    concat::fragment{ "dsm.sys fragment_${name}":
      target  => '/opt/tivoli/tsm/client/ba/bin/dsm.sys',
      order   => $order,
      content => "${body}\n"
    }
  }
