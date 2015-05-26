class users($name,$comment='',$key='') {
  user { "${name}":
    name => "${name}",
    ensure  => present,
    comment => $comment,
    home    => "/home/${name}",
    shell => '/bin/bash',
    password => '*',
    notify => File["/home/${name}"],
  }

  file { "/home/${name}":
    ensure => directory,
    owner => "${name}",
    mode => 700,
  }

  file { "/home/${name}/.ssh":
    ensure => directory,
    owner => "${name}",
    mode => 700,
    require => File["/home/${name}"],
  }
	

  ssh_authorized_key { "${name}":
    user => "${name}",
    type => rsa,
    key => "${key}",
    require => File["/home/${name}/.ssh"],
  }
}
