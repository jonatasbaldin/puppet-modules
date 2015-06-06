# class puppetclient::install
class puppetclient::install inherits puppetclient {

  # repo
  package { $repo_name:
    ensure   => $package_ensure,
    provider => $provider,
    source   => $repo_url,
  }

  # if Debian-like, runs apt-get update
  if $::osfamily == 'Debian' {
    exec { 'apt-get-update':
      command => 'apt-get update -y',
      path    => '/usr/bin',
      before  => Package[$package_name],
    }
  }

  # package
  package { $package_name:
    ensure  => $package_ensure,
    require => Package[$repo_name],
  }

}
