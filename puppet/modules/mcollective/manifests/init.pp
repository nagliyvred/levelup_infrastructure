class mcollective {

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

  mcollective::agent { "deploy": agent_name => "deploy" }
  mcollective::agent { "sync":   agent_name => "sync" }
  mcollective::agent { "puppet": agent_name => "puppet" }

 define mcollective::agent($agent_name) {

  file { "/usr/share/mcollective/plugins/mcollective/agent/$agent_name.ddl": 
    ensure => present,
    source => "puppet:///modules/mcollective/agent/$agent_name.ddl",
    replace => true,
    owner => "root",
    group => "root"
  }
  file { "/usr/share/mcollective/plugins/mcollective/agent/$agent_name.rb": 
    ensure => present,
    source => "puppet:///modules/mcollective/agent/$agent_name.rb",
    replace => true,
    owner => "root",
    group => "root"
  }

 }
}
