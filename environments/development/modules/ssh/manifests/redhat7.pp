#
class ssh::redhat7 ()
{
  # Puppet controls PermitRootLogin in /etc/sshd_config file.
  file_line{'/etc/ssh/sshd_config PermitRootLogin':
    path   => '/etc/ssh/sshd_config',
    line   => 'PermitRootLogin yes',
    match  => '^PermitRootLogin ',
    notify => Service['sshd'],
  }

  file_line{'/etc/ssh/sshd_config UsePrivilegeSeparation':
    path   => '/etc/ssh/sshd_config',
    line   => 'UsePrivilegeSeparation yes',
    match  => '^UsePrivilegeSeparation ',
    notify => Service['sshd'],
  }
}
