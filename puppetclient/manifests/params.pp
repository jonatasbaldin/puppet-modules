# class puppetclient::params
class puppetclient::params {

  # install.pp
  $package_ensure = present

  # config.pp
  $config_file                = '/etc/puppet/puppet.conf'
  $config_template            = 'puppetclient/puppet.conf.erb'
  $config_status              = present
  $config_owner               = 'root'
  $config_group               = 'root'
  $config_mode                = '644'
  $server_hostname            = 'puppet.labjonatas.com'
  $env                        = 'production'
  $runinterval                = '10m'

  # service.pp
  $service_ensure  = running

  # install from repos
  case $::osfamily {
    'RedHat': {
      $provider     = 'rpm'
      $package_name = 'puppet'
      $service_name = 'puppet'
      $repo_name    = 'puppetlabs-release'

      if $::operatingsystemmajrelease == 7 {
        $repo_url = 'https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm'
      } elsif $::operatingsystemmajrelease == 6 {
        $repo_url = 'https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm'
      }
    }
    'Debian': {
      $provider     = 'dpkg'
      $package_name = 'puppet'
      $service_name = 'puppet'
      $repo_name    = 'puppetlabs-release'
      
      # TODO: refactor
      if $::operatingsystemrelease == 14.04 {
        exec { 'wget':
          command => 'wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb -P /usr/src',
          creates => '/tmp/puppet.repo',
          path    => '/usr/bin',
          before  => Class['puppetclient::install'],
        }
        $repo_url = '/usr/src/puppetlabs-release-trusty.deb'
      } elsif ::operatingsystemmajrelease == 12.04 {
        exec { 'wget':
          command => 'wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb -P /usr/src',
          creates => '/tmp/puppet.repo',
          path    => '/usr/bin',
          before  => Class['puppetclient::install'],
        }
        $repo_url = '/usr/src/puppetlabs-release-precise.deb'
      }
      
    }
    default: {
      fail("${::osfamily} is not a supported operating system")
    }
  }
}
