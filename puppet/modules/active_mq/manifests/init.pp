class active_mq  {

 # this whole file is a dirty hack

  package { "openjdk-6-jre":
    ensure => installed
  }



  file { "/etc/activemq/activemq.xml":
    ensure  => present,
    content => template("active_mq/activemq.xml.erb"),
    require => File["/etc/activemq"],
    backup => false
  }

  file { "/etc/activemq":
    ensure => directory,
    mode   => 0755,
  }

  file { "/etc/activemq/start_mq.sh":
    ensure => present,
    content => template("active_mq/start_mq.sh"),
    mode => 744,
    owner => root,
    backup => false
  }

  exec { "activemq":
    command => "/etc/activemq/start_mq.sh",
    path => "/usr/bin:/bin",
    unless => "ps aux | grep java",
    #stop => "kill `pgrep -l java | awk '{ print $1 }'`",
    require => [
                File["/etc/activemq/start_mq.sh"],
                File["/etc/activemq/activemq.xml"]]
  }
}

