class infrastructure {


  file { "/usr/bin/run_puppet.sh":
    ensure => present,
    owner => "root",
    group => "root",
    mode => 0655,
    content => template('infrastructure/run_puppet.sh')
   }

  file { "/usr/bin/run_sync.sh":
    ensure => present,
    owner => "root",
    group => "root",
    mode => 0655,
    content => template('infrastructure/run_sync.sh')
   }


  notify { "infrastructure":
    message => "infrastructure"
    }


}
