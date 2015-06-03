node 'netbook-01.labjonatas.com' {
  class { 'users':
    name    => 'jonatas',
    comment => 'Jojo',
  }
 
  class { 'ntp':
    server => ['a.ntp.br','b.ntp.br'],
  }
}

node 'h03.labjonatas.com' {
  class { 'ntp':
    server => ['a.ntp.br','b.ntp.br'],
  }
}
