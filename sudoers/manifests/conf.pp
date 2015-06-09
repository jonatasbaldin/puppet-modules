# sudoers::conf class
define sudoers::conf (
  $cont = undef,
) {

  # if there's no file content, copies file 
  if $cont == undef {
    file { "/etc/sudoers.d/${name}":
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0440',
      #validate_cmd => '/sbin/visudo -c -q -f %',
      source => "puppet:///modules/sudoers/${name}",
    }
  # if not, create a file with some content
  } else {
    file { "/etc/sudoers.d/${name}":
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0440',
      #validate_cmd => '/sbin/visudo -c -q -f %',
      content => "${cont}\n",
    }
  }
}
