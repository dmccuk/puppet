class motd {

  file { '/etc/motd':
   ensure => file,
   content => "this is the MOTD file",
  }
}
