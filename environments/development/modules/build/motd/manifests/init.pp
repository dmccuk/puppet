#
class motd {

  notify { "This is the MOTD module": }

  file { '/etc/motd':
    ensure  => present,
    content => 'welcome! - This is the Development MOTD. ',
  }
}
