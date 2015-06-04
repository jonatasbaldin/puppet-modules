# sudoers module
class sudoers {

  file { '/etc/sudoers':
    ensure  => present,
    group   => 'root',
    owner   => 'root',
    mode    => '0440',
    content => template("${module_name}/sudoers.erb"),
  }

}
