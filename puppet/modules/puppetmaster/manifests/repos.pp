 class puppetmaster::repos($git_user, $git_passwd) {

  file { "/etc/gitconfig":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 0644,
    content => template("puppetmaster/gitconfig.erb"),
  }

  file { "/data":
    ensure => directory,
  }

     git::clone { "infrastructure-repo":
        repo_name => "levelup_infrastructure",
        dest      => "/data/puppet_code/",
        repo_url  => "https://github.com/nagliyvred/levelup_infrastructure.git",
        require   => File["/etc/gitconfig"]
    }


}
