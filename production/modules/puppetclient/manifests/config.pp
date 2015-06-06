# class puppetclient::config
class puppetclient::config inherits puppetclient {
  
  file { $config_file:
    ensure  => $config_ensure,
    owner   => $config_owner, 
    group   => $config_group,
    mode    => $config_mode,
    content => template($config_template),
  }

  # if Debian-like, enable service
  if $::osfamily == 'Debian' {
    file { '/etc/default/puppet':
      source => 'puppet:///modules/puppetclient/puppet',
    }
  }

}
