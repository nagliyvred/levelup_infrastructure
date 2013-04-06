class testinvaders {

  file { "/etc/testinvaders":
    content => "just a test",
    ensure => present
  }

}
