#
class cis::security_limits {

  # 1.6.1 Restrict Core Dumps
  exec { 'Restrict_core_dupms':
    command => 'echo "* hard core 0" >> /etc/security/limits.conf',
    path    => '/usr/sbin/:/bin/:/sbin/',
    unless  => 'grep "* hard core 0" /etc/security/limits.conf',
  }

}
