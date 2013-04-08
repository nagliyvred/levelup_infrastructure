class mcollective {

 notify { "mcollective class": 
  message => "mcollective"
  }
  package { "stomp":
    ensure => latest,
    provider => "gem"
  }


  package { "mcollective":
    ensure => latest,
    provider => apt
  }

  package { "mcollective-common":
    ensure => latest,
    provider => apt
  }
  
  package { "mcollective-puppet-agent":
    ensure => latest,
    provider => apt
    }


  file { "/etc/mcollective/server.cfg":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 640,
    require => Package["mcollective"],
    content => template("mcollective/server.cfg.erb"),
    backup => false
  }

  file { "/usr/share/mcollective/plugins/mcollective/agent/deploy.ddl": 
    ensure => present,
    source => "puppet:///modules/mcollective/agent/deploy.ddl",
    #recurse => true,
    replace => true,
    owner => "root",
    group => "root"
  }
  file { "/usr/share/mcollective/plugins/mcollective/agent/deploy.rb": 
    ensure => present,
    source => "puppet:///modules/mcollective/agent/deploy.rb",
    #recurse => true,
    replace => true,
    owner => "root",
    group => "root"
  }
  file { "/usr/share/mcollective/plugins/mcollective/agent/sync.ddl": 
    ensure => present,
    source => "puppet:///modules/mcollective/agent/sync.ddl",
    #recurse => true,
    replace => true,
    owner => "root",
    group => "root"
  }
  file { "/usr/share/mcollective/plugins/mcollective/agent/sync.rb": 
    ensure => present,
    source => "puppet:///modules/mcollective/agent/sync.rb",
    #recurse => true,
    replace => true,
    owner => "root",
    group => "root"
  }



}
