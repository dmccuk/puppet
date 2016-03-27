#
class cis::sysconfig_init {

  # 1.5.4 Require Authentication for Single-User Mode
  file_line{'/etc/sysconfig/init sulogin':
    path  => '/etc/sysconfig/init',
    line  => 'SINGLE=/sbin/sulogin',
    match => '^SINGLE',
  }
  # 1.5.5 Disable Interactive Boot
  file_line{'/etc/sysconfig/init prompt':
    path  => '/etc/sysconfig/init',
    line  => 'PROMPT=no',
    match => '^PROMPT',
  }
  # 3.1 Set Daemon umask
  file_line{'/etc/sysconfig/init umask':
    path  => '/etc/sysconfig/init',
    line  => 'umask 027',
    match => '^umask',
  }

}
