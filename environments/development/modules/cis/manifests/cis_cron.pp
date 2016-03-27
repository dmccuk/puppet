#
class cis::cis_cron {

  # 6.1.4 Set User/Group Owner and Permission on /etc/crontab
  file { '/etc/crontab':
    ensure => present,
    mode   => '0600',
    owner  => 'root',
    group  => 'root',
  }
  # 6.1.5 Set User/Group Owner and Permission on /etc/cron.hourly
  file { '/etc/cron.hourly':
    ensure => directory,
    mode   => '0600',
    owner  => 'root',
    group  => 'root',
  }
  # 6.1.6 Set User/Group Owner and Permission on /etc/cron.daily
  file { '/etc/cron.daily':
    ensure => directory,
    mode   => '0600',
    owner  => 'root',
    group  => 'root',
  }
  # 6.1.7 Set User/Group Owner and Permission on /etc/cron.weekly
  file { '/etc/cron.weekly':
    ensure => directory,
    mode   => '0600',
    owner  => 'root',
    group  => 'root',
  }
  # 6.1.8 Set User/Group Owner and Permission on /etc/cron.monthly
  file { '/etc/cron.monthly':
    ensure => directory,
    mode   => '0600',
    owner  => 'root',
    group  => 'root',
  }
  # 6.1.9 Set User/Group Owner and Permission on /etc/cron.d
  file { '/etc/cron.d':
    ensure => directory,
    mode   => '0600',
    owner  => 'root',
    group  => 'root',
  }
  # 6.1.11 Restrict at/cron to Authorized Users
  file { '/etc/cron.deny':
    ensure => absent,
  }
  # 6.1.11 Restrict at/cron to Authorized Users
  file { '/etc/cron.allow':
    ensure => present,
    mode   => '0600',
    owner  => 'root',
    group  => 'root',
  }

}
