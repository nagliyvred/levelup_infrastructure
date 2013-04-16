node default {

  include testinvaders
  include puppet_base
  include mcollective
  include infrastructure
  include puppetmaster::repos
  include puppetmaster
  include git

  package { 'mysql' :
       ensure => installed,
  }
  	
}

node "master.levelup" inherits default {
#  include puppetmaster
  include mcollective::client
  include active_mq


}

node "package.levelup" inherits default { 

  
}

