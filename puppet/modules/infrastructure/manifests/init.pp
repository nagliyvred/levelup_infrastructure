class infrastructure {

  file { "/opt/build":
    ensure => directory,
    owner => "root",
    group => "root",
    mode => 0655
  }

  file { "/opt/infrastructure/bin/run_sync.sh":
    ensure => present,
    owner => "root",
    group => "root",
    mode => 0655,
    content => template('infrastructure/run_sync.sh'),
    require => File["/opt/build"]
   }

  file { "/opt/infrastructure/bin/deploy.sh":
    ensure => present,
    owner => "root",
    group => "root",
    mode => 0655,
    content => template('infrastructure/deploy.sh'),
    require => File["/opt/build"]
   }

  file { "/opt/infrastructure/bin/heroku.sh":
    ensure => present,
    owner => "root",
    group => "root",
    mode => 0655,
    content => template('infrastructure/heroku.sh'),
    require => File["/opt/build"]
   }


}
