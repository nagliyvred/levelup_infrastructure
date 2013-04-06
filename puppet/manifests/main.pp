node default {
  
  file { "/etc/testfile":
    ensure => present,
    content => "blabla1"
  }

  include testinvaders
  include puppet_base

}


node "master.levelup" {

  notify { "master.levelup":
    message => "i am running"
    }
#  include puppetmaster
  include puppetmaster::repos
  include git

}


node "orion" {

  file { "/Users/edudin/test-file-orion":
    ensure => present,
    content => "blabla-orion"
  }



}
