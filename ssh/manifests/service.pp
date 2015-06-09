# class ssh::service
# inherits the main class, who inherits the ssh::params
class ssh::service inherits ssh {
  service { $service_name:
    ensure => $service_ensure,  
  }
}
