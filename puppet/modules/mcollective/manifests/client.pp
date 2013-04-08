class mcollective::client {


  notify { "mcollective client":
    message => "mcollective client"
    }

  package { "mcollective-puppet-client":
    ensure => latest
  }

  package { "mcollective-client":
    ensure => latest
  }

  file { "/etc/mcollective/client.cfg":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 644,
    require => [Package["mcollective-client"]],
    content => template("mcollective/client.cfg.erb"),
    backup => false
  }


}
