# users class
define users (
  $comment='', 
  $key='',
) {

  user { $name:
    name => $name,
    comment  => $comment,
    ensure   => present,
    home     => "/home/${name}",
    shell    => '/bin/bash',
    password => '*',
    before   => File["/home/${name}"],
  }

  file { "/home/${name}":
    ensure  => directory,
    owner   => $name,
    mode    => 700,
    require => User[$name],
  }

  file { "/home/${name}/.ssh":
    ensure  => directory,
    owner   => $name,
    mode    => 700,
    require => File["/home/${name}"],
  }

  ssh_authorized_key { $name:
    user    => $name,
    type    => rsa,
    key     => $key,
    require => File["/home/${name}/.ssh"],
  }
}
