node default {
  
  file { "/etc/testfile":
    ensure => present,
    content => "blabla1"
  }

  include testinvaders
  include puppet_base

}


node "master.levelup" {

  include puppetmaster
  include puppetmaster::repos
  include git

}

