node 'netbook-01.labjonatas.com' {
  class { 'users':
    name    => 'jonatas',
    comment => 'Jojo',
  }
 
  class { 'ntp':
    server => ['a.ntp.br','b.ntp.br'],
  }

  class { 'dnsconf':
    servers => ['10.1.10.7', '10.1.10.8'],
    domain => 'labjonatas.com',
  }

  class { 'sudoers': }
  sudoers::conf { 'jonatas': 
    cont => 'jonatas ALL=(ALL:ALL) NOPASSWD: ALL',
  }

}

node 'h03.labjonatas.com' {
  class { 'ntp':
    server => ['a.ntp.br','b.ntp.br'],
  }

  class { 'dnsconf':
    servers => ['10.1.10.7', '10.1.10.8'],
    domain => 'labjonatas.com',
  }

  class { 'sudoers': }
  sudoers::conf { 'jonatas':
    cont => 'jonatas ALL=(ALL:ALL) NOPASSWD: ALL',
  }

}
