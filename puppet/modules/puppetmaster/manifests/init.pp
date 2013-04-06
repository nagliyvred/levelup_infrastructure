class puppetmaster {
  package { "puppetmaster":
    ensure   => present
  }

  file { "/etc/puppet/puppet.conf":
    content => template("puppetmaster/etc/puppet/puppet.conf.erb"),
  }
}
