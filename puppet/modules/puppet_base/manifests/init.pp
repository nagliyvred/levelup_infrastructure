class puppet_base {


  notify { "test":
    message => "puppet class",
    }
  
  group { "puppet":
    ensure => present
 }

  user { "puppet":
    ensure => present,
    require => Group["puppet"]
  }

  package { "puppet-common":
    ensure => present,
    provider => apt
  }

  package {"puppet":
    ensure => present,
    provider => apt,
    }
}
