# dnsconf class
class dnsconf ($servers=[], $domain) {

  file { '/etc/resolv.conf':
    ensure => present,
    group => 'root',
    owner => 'root',
    mode => '644',
    content => template('dnsconf/resolv.conf.erb'),
  }
}
