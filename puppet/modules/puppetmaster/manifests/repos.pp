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

  file { "/data/puppet_code":
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => 644,
    backup => false,
    require => File["/data"],
  }

    define git_clone {
    git::clone { "${name}-repo":
        repo_name => "levelup_infrastructure",
        dest      => "/data/puppet_code/${name}",
        repo_url  => "https://github.com/nagliyvred/levelup_infrastructure.git",
        require   => File["/etc/gitconfig"]
    }

  }

  $environments = [ 'infrastructure', 'noop', 'dev', 'prod' ]

  git_clone {
    $environments:
  }


}
