#
class cis::boot_log {

  # 5.1.4 Create and Set Permissions on rsyslog Log Files
  file { '/var/log/boot.log':
    ensure => present,
    mode   => '0600',
    owner  => 'root',
    group  => 'root',
  }

}
