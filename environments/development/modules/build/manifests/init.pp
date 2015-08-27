#
class motd {

  notify { "This is the MOTD module": }

  file { '/etc/motd':
    ensure  => present,
    content => template('motd/tmp.erb'),
  }
}
