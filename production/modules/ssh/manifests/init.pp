# ssh module
# in the main class, we assing all variables that the user can use
# inheriting the ssh::params class
# this way, the user can config everything from one statement in the site.pp
# 
# class { 'ssh':
#   $port => '2222',
#   $rootlogin => 'no',
# }
#
# in the other classes, we inherit this main, to not duplicate

class ssh (
  # install.pp
  $package_name     = $ssh::params::package_name,
  $package_ensure   = $ssh::params::package_ensure,

  # config.pp
  $config_status    = $ssh::params::config_status,
  $config_owner     = $ssh::params::config_owner,
  $config_group     = $ssh::params::config_group,
  $config_mode      = $ssh::params::config_mode,
  $config_template  = $ssh::params::config_template,
  $port             = $ssh::params::port,
  $hostkeys         = $ssh::params::hostkeys,
  $rootlogin        = $ssh::params::rootlogin,
  $pubkeyauth       = $ssh::params::pubkeyauth,
  $passwordauth     = $ssh::params::passwordauth,
  $emptypassword    = $ssh::params::emptypassword,
  $usedns           = $ssh::params::usedns,

  # sevice.pp
  $service_name     = $ssh::params::service_name,
  $service_ensure   = $ssh::params::service_ensure,

  # get all parameters
) inherits ssh::params {

 # ordering the classes 
 class { 'ssh::install': } ->
 class { 'ssh::config': } ~>
 class { 'ssh::service': } ->
 # ensures that if someone just calls require => Class["ssh"], everything before happens first
 Class["ssh"]
}
