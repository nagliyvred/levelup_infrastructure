import 'main.pp'



filebucket {
  main: server => puppet
}

File {
  backup => main
}
