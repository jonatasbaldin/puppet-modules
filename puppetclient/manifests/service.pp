# class puppertclient::service
class puppetclient::service inherits puppetclient {
  service { $service_name:
    ensure => $service_ensure,
  }
}
