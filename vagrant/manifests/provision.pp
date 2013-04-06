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

  }

