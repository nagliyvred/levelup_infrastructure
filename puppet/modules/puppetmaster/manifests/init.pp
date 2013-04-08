class puppetmaster {

  file { "/etc/puppet/puppet.conf":
    content => template("puppetmaster/etc/puppet/puppet.conf.erb"),
    backup => false
  }

  file { "/etc/puppet/hiera.yaml":
    content => template("puppetmaster/hiera.yaml.erb"),
    ensure => present
  }
}
