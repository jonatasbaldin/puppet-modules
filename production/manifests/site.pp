node 'netbook-01.labjonatas.com' {
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

  users { 'jonatas':
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDdEbE2sE99pW2trq5fV1PNQGES8WJc4AO29VH8VhVhYqTvXklP9kU1I739ZRANztTbvYKlLyJKFRw8VdvUVWlApHvH4UNFqqK18iifE+mPl+PVpmKypyggK9QUjKJq284LABz2TH8jQuPNAKm/Wc+ZRRtY2BsYxxvQ5Rh61Bcb8U6pHxzhRATVWKqMRuXJOH2VPVll3SU62iYjnYAkVnncaZJFIhROJhae/PZ3wQliDF3oz7gdIYfHNHD/eFXfujDIMj+rMQtZUKU6BheltWXmE5rE0W2lvxYvlXs4ZPA8026qD7MZlnZFk5r0xQI9nSNolrEGGosckiNUVmB2j3gB',
  }

  class { 'ssh':
    rootlogin     => 'no',
    pubkeyauth    => 'yes',
    passwordauth  => 'no',
    emptypassword => 'no',
    usedns        => 'no',        
  }
  
  class { 'puppetmaster': }
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

  users { 'jonatas':
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDdEbE2sE99pW2trq5fV1PNQGES8WJc4AO29VH8VhVhYqTvXklP9kU1I739ZRANztTbvYKlLyJKFRw8VdvUVWlApHvH4UNFqqK18iifE+mPl+PVpmKypyggK9QUjKJq284LABz2TH8jQuPNAKm/Wc+ZRRtY2BsYxxvQ5Rh61Bcb8U6pHxzhRATVWKqMRuXJOH2VPVll3SU62iYjnYAkVnncaZJFIhROJhae/PZ3wQliDF3oz7gdIYfHNHD/eFXfujDIMj+rMQtZUKU6BheltWXmE5rE0W2lvxYvlXs4ZPA8026qD7MZlnZFk5r0xQI9nSNolrEGGosckiNUVmB2j3gB',
  }
  class { 'ssh':
    rootlogin     => 'no',
    pubkeyauth    => 'yes',
    passwordauth  => 'no',
    emptypassword => 'no',
    usedns        => 'no',        
  }

  class { 'puppetclient': }
}
