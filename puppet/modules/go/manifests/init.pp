class go {

 file { "/etc/go/cruise-config.xml":
    content => template(""),
    owner   => "go",
    group   => "go",
    mode    =>  0644,
    alias   => "cruise-config.xml",
    require => [File["/etc/go"]]
  }
}
