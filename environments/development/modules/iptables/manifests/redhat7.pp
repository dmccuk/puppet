#
class iptables::redhat7 ()
{
  service { 'firewalld':
    enable => false,
    ensure => stopped,
  }
}

