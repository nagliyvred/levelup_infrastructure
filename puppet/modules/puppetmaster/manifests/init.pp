class puppetmaster {
  package { "puppetmaster":
    ensure   => present
  }

  file { "/etc/puppet/puppet.conf":
    content => template("puppetmaster/etc/puppet/puppet.conf.erb"),
    backup => false
  }

  file { "/etc/puppet/hiera.yaml":
    content => template("puppetmaster/hiera.yaml"),
    ensure => present
  }
}
