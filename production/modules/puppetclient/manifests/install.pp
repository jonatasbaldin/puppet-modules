# class puppetclient::install
class puppetclient::install inherits puppetclient {

  # repo
  package { $repo_name:
    ensure   => $package_ensure,
    provider => $provider,
    source   => $repo_url,
  }

  # package
  package { $package_name:
    ensure  => $package_ensure,
    require => Package[$repo_name],
  }

}
