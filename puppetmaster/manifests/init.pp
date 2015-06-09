# class puppetmaster
# Use: class { 'puppetmaster': }

class puppetmaster (
) inherits puppetmaster::params {
  class { 'puppetmaster::install': } ->
  class { 'puppetmaster::config': } ~>
  class { 'puppetmaster::service': } ->
  Class["puppetmaster"]
}
