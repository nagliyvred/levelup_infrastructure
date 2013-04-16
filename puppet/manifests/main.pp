node default {
  
  include testinvaders
  include puppet_base
  include mcollective
  include infrastructure 
  include puppetmaster::repos
  include puppetmaster
  include git
  include squid
}

node "master.levelup" inherits default {
#  include puppetmaster
  include mcollective::client
  include active_mq
}


 node "possum.levelup" inherits default {

    file { "/etc/testfile":
      ensure => present,
      owner => "root"
    }

 }



something changed and it will be broken


