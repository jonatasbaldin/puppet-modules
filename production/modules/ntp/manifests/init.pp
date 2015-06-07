# ntp package
class ntp ( $server=[ 'UNSET' ] ) {

  case $::osfamily {
    'RedHat': {
       $service_name = 'ntpd'
     }
     'Debian': {
       $service_name = 'ntp'
     {
  }

  package { 'ntp':
    ensure => installed,
  }

  file { '/etc/ntp.conf':
    content => template('ntp/ntp.conf.erb'),
    notify  => Service['ntpd'],
  }

  service { $service_name:
    ensure  => running,
    enable  => true,
    require => [ Package['ntp'], File['/etc/ntp.conf'] ],
  }
} 
