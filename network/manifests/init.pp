# class network
class network (
) inherits network::params { 
  class { 'network::global': }
  class { 'network::iface': }
  class { 'network::service': }
}
