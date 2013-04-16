class git{
  file { "/etc/test.conf":
    owner  => "root"
  }

  package { "git":
    provider => "apt",
    ensure => "latest",
  }
}

define git::clone($repo_name, $dest, $repo_url) {

  file { "${dest}":
    ensure => directory,
    owner  => "root",
    group  => "root"
  }

  exec { "git clone ${repo_url} ${dest}/${repo_name}":
    creates => "${dest}/${repo_name}/.git",
    require => [ Package["git"], File["${dest}"] ],
    path    => "/usr/bin:/usr/sbin:/bin",
    onlyif  => "test -n '${repo_name}' && test -n '${dest}'"
  }
}
