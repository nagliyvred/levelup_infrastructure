include provision

class provision {


File {
  backup => false
}


  host { "master.levelup":
    ip     => "192.168.25.1",
    ensure => present
  }
 
  file { "/etc/puppet" :
    ensure => directory,
    owner  => root,
    group  => root
  }

  file { "/etc/hosts":
	backup => false
}

  package { "git":
    ensure => installed,
    provider => "apt"
  }

  package { "vim":
    ensure => installed,
    provider => apt
    }

#  file {"/etc/apt/sources.list":
#    source => "/vagrant/share/sources.list",
#    ensure => present
#  }

#  exec { "apt-get update":
#    command => "/usr/bin/apt-get update",
#    subscribe => File["/etc/apt/sources.list"],
#    refreshonly => true,
#  }

}

