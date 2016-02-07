#
class iptables::redhat6 ()
{
  service { 'iptables':
    enable => false,
    ensure => stopped,
  }
}

