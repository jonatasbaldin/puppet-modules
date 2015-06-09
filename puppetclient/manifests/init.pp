# class puppetclient
# Use: class { 'puppetclient': }

class puppetclient (
  $server_hostname      = $puppetclient::params::server_hostname,
  $env                  = $puppetclient::params::env,
  $runinterval          = $puppetclient::params::runinterval,

) inherits puppetclient::params {
  class { 'puppetclient::install': } ->
  class { 'puppetclient::config': } ~>
  class { 'puppetclient::service': } ->
  Class["puppetclient"]
}
