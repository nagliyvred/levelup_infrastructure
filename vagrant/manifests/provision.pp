include provision

class provision {

  host { "slave.levelup":
    ip     => "127.0.0.1",
    ensure => present
  }

 
  file { "/etc/puppet" :
    ensure => directory,
    owner  => root,
    group  => root
  }

  file { "/etc/puppet/puppet.conf" :
    source  => "/vagrant/share/puppet.conf",
    owner   => root,
    group   => root,
    require => File["/etc/puppet"]
  }

  package { "git":
    ensure => installed,
    provider => "apt"
  }

  package { "vim":
    ensure => installed,
    provider => apt
    }

  file {"/etc/apt/sources.list":
    source => "/vagrant/share/sources.list"
    ensure => present
  }

  exec { "apt-get update":
    command => "apt-get update",
    subscribe => File["/etc/apt/sources.list"],
    refreshonly => true
  }

}

