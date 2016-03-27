#
class ssh::redhat6 ()
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
  # 6.2.2 Set LogLevel to INFO
  file_line{'/etc/ssh/sshd_config ssh_log_level':
    path   => '/etc/ssh/sshd_config',
    line   => 'LogLevel INFO',
    match  => '^LogLevel',
    notify => Service['sshd'],
  }
  # 6.2.4 Disable SSH X11 Forwarding
  file_line{'/etc/ssh/sshd_config X11_forwarding':
    path   => '/etc/ssh/sshd_config',
    line   => 'X11Forwarding no',
    match  => '^X11Forwarding',
    notify => Service['sshd'],
  }
  # 6.2.5 Set SSH MaxAuthTries to 4 or Less
  file_line{'/etc/ssh/sshd_config MaxAuthTries':
    path   => '/etc/ssh/sshd_config',
    line   => 'MaxAuthTries 4',
    match  => '^MaxAuthTries',
    notify => Service['sshd'],
  }
  # 6.2.6 Set SSH IgnoreRhosts to Yes
  file_line{'/etc/ssh/sshd_config IgnoreRhosts':
    path   => '/etc/ssh/sshd_config',
    line   => 'IgnoreRhosts yes',
    match  => '^IgnoreRhosts',
    notify => Service['sshd'],
  }
  # 6.2.7 Set SSH HostbasedAuthentication to No
  file_line{'/etc/ssh/sshd_config HostbasedAuthentication':
    path   => '/etc/ssh/sshd_config',
    line   => 'HostbasedAuthentication no',
    match  => '^HostbasedAuthentication',
    notify => Service['sshd'],
  }
  # 6.2.9 Set SSH PermitEmptyPasswords to No
  file_line{'/etc/ssh/sshd_config PermitEmptyPasswords':
    path   => '/etc/ssh/sshd_config',
    line   => 'PermitEmptyPasswords no',
    match  => '^PermitEmptyPasswords',
    notify => Service['sshd'],
  }
  # 6.2.10 Do Not Allow Users to Set Environment Options
  file_line{'/etc/ssh/sshd_config User_Env_option':
    path   => '/etc/ssh/sshd_config',
    line   => 'PermitUserEnvironment no ',
    match  => '^PermitUserEnvironment',
    notify => Service['sshd'],
  }
  # 6.2.11 Use Only Approved Cipher in Counter Mode
  file_line{'/etc/ssh/sshd_config Use_approved_cipher':
    path   => '/etc/ssh/sshd_config',
    line   => 'Ciphers aes128-ctr,aes192-ctr,aes256-ctr',
    match  => '^Ciphers',
    notify => Service['sshd'],
  }
  # 6.2.12 Set Idle Timeout Interval for User Login
  file_line{'/etc/ssh/sshd_config Idle_timeout_interval':
    path   => '/etc/ssh/sshd_config',
    line   => 'ClientAliveInterval 1800',
    match  => '^ClientAliveInterval',
    notify => Service['sshd'],
  }
  # 6.2.12 Set Idle Timeout Interval for User Login
  file_line{'/etc/ssh/sshd_config Idle_timeout_interval_max_count':
    path   => '/etc/ssh/sshd_config',
    line   => 'ClientAliveCountMax 0',
    match  => '^ClientAliveCountMax',
    notify => Service['sshd'],
  }
  # 6.2.13 Limit Access via SSH
  file_line{'/etc/ssh/sshd_config Limit_Access_via_SSH':
    path   => '/etc/ssh/sshd_config',
    line   => 'DenyGroups DeniedGroup',
    match  => '^DenyGroups',
    notify => Service['sshd'],
  }
  # 6.2.14 Set SSH Banner
  file_line{'/etc/ssh/sshd_config SSH_banner':
    path   => '/etc/ssh/sshd_config',
    line   => 'Banner /etc/issue.net',
    match  => '^Banner',
    notify => Service['sshd'],
  }
}
