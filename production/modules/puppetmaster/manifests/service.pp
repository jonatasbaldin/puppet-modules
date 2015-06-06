# class puppertmaster::service
class puppetmaster::service inherits puppetmaster {
  service { $service_name:
    ensure => $service_ensure,
  }
}
