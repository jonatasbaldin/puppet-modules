# class puppetclient::config
class puppetclient::config inherits puppetclient {
  
  file { $config_file:
    ensure  => $config_ensure,
    owner   => $config_owner, 
    group   => $config_group,
    mode    => $config_mode,
    content => template($config_template),
  }
}
