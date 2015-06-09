# class ssh::install
# inherits the main class, who inherits the ssh::params
class ssh::install inherits ssh {
  package { $package_name:
    ensure => $package_ensure,
  }
}
