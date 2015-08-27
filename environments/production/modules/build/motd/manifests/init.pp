#
class motd {

  notify { "This is the MOTD module": }

  file { '/etc/motd':
    ensure  => present,
    #content => 'welcome! This is the production MOTD...! ',
    content => template('motd/tmp.erb'),
  }
}
