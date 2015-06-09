class ssh::params {

  # install.pp
  $package_ensure  = latest

  # config.pp
  $config_file     = '/etc/ssh/sshd_config'
  $config_template = 'ssh/sshd_config.erb'
  $config_status   = present
  $config_owner    = 'root'
  $config_group    = 'root'
  $port            = '22'
  $hostkeys        = ['/etc/ssh/ssh_host_rsa_key', '/etc/ssh/ssh_host_ecdsa_key']
  $rootlogin       = 'no'
  $pubkeyauth      = 'yes'
  $passwordauth    = 'yes'
  $emptypassword   = 'yes'
  $usedns          = 'no'
  
  # service.pp
  $service_ensure  = running

  case $::osfamily {
    'RedHat': { 
      $package_name = 'openssh-server'
      $service_name = 'sshd'
      $config_mode  = '600'
     }

     'Debian': {
      $package_name = 'openssh-server'
      $service_name = 'ssh'
      $config_mode  = '644'
     }
  }
}
