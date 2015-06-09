# ssh::config class
# inherits the main class, who inherits the ssh::params
class ssh::config inherits ssh {
  file { $config_file:
    ensure  => $config_status,
    owner   => $config_owner,
    group   => $config_group,
    mode    => $config_mode,
    content => template($config_template),
  }

}
