#
class cis::sysctl {

  file { "/etc/sysctl.conf":
    ensure => present,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => '/etc/sysctl.conf',
  } 

  # 4.1.2 Disable Send Packet Redirects
  file_line{'/etc/sysctl.conf disable_send_redirects':
    path  => '/etc/sysctl.conf',
    line  => 'net.ipv4.conf.all.send_redirects=0',
    match => '^net.ipv4.conf.all.send_redirects',
  } ->
  file_line{'/etc/sysctl.conf disable_default_send_redirects':
    path  => '/etc/sysctl.conf',
    line  => 'net.ipv4.conf.default.send_redirects=0',
    match => '^net.ipv4.conf.default.send_redirects',
  } ->
  # 4.2.2 Disable ICMP Redirect Acceptance
  file_line{'/etc/sysctl.conf all_accept_redirects':
    path  => '/etc/sysctl.conf',
    line  => 'net.ipv4.conf.all.accept_redirects=0',
    match => '^net.ipv4.conf.all.accept_redirects',
  } ->
  file_line{'/etc/sysctl.conf default_accept_redirects':
    path  => '/etc/sysctl.conf',
    line  => 'net.ipv4.conf.default.accept_redirects=0',
    match => '^net.ipv4.conf.default.accept_redirects',
  } ->
  # 4.4.1.1 Disable IPv6 Router Advertisements
  file_line{'/etc/sysctl.conf all_accepts':
    path  => '/etc/sysctl.conf',
    line  => 'net.ipv6.conf.all.accept_ra=0',
    match => '^net.ipv6.conf.all.accept_ra',
  } ->
  file_line{'/etc/sysctl.conf default_accepts':
    path  => '/etc/sysctl.conf',
    line  => 'net.ipv6.conf.default.accept_ra=0',
    match => '^net.ipv6.conf.default.accept_ra',
  } ->
  # 4.4.1.2 Disable IPv6 Redirect Acceptance
  file_line{'/etc/sysctl.conf ivp6_all_accept_redirects':
    path  => '/etc/sysctl.conf',
    line  => 'net.ipv6.conf.all.accept_redirects=0',
    match => '^net.ipv6.conf.all.accept_redirects',
  } ->
  file_line{'/etc/sysctl.conf ipv6_default_accept_redirects':
    path  => '/etc/sysctl.conf',
    line  => 'net.ipv6.conf.default.accept_redirects=0',
    match => '^net.ipv6.conf.default.accept_redirects',
  } ->
  # 4.2.4 Log Suspicious Packets
  file_line{'/etc/sysctl.conf Log_all_martians':
    path  => '/etc/sysctl.conf',
    line  => 'net.ipv4.conf.all.log_martians=1',
    match => '^net.ipv4.conf.all.log_martians',
  } ->
  file_line{'/etc/sysctl.conf Log_default_martians':
    path  => '/etc/sysctl.conf',
    line  => 'net.ipv4.conf.default.log_martians=1',
    match => '^net.ipv4.conf.default.log_martians',
  } ->

# This is a bit of a fudge. sorry to leave this with you.
# This Exec tests to see if /etc/sysctl.conf has been updated in the last 3 minutes.
# If it has it will run, otherwise it won't.
  exec { "/sbin/sysctl -p":
    onlyif => 'test -n "$(find /etc -name sysctl.conf -mmin -3)"',
    path   => '/usr/sbin/:/bin/:/sbin/:/usr/bin',
  } 

# I wanted to use this exec but it wouldn't refresh the file once updated.
# when using file_line.
#  exec { "reload_sysctl":
#    refreshonly => true,
#    command     => "sysctl -p",
#    path        => '/usr/sbin/:/bin/:/sbin/',
#    subscribe   => File["/etc/sysctl.conf"],
#   }

}
