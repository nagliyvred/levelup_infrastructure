node default {
  
  file { "/Users/edudin/test-file":
    ensure => present,
    content => "blabla"
  }


}


node "orion" {

  file { "/Users/edudin/test-file-orion":
    ensure => present,
    content => "blabla-orion"
  }



}
