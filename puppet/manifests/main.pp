node default {
  
  include testinvaders
  include puppet_base
  include mcollective
  include infrastructure 
  include puppetmaster::repos
  include puppetmaster
  include git
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

node "possum.levelup" inherits default {
  cron { sendmessage:
    command => "/usr/local/sendmessage",
    user => vagrant,
    weekday => Friday,
    hour => 14
  }
}
