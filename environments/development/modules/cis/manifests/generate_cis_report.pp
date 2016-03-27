#
class cis::generate_cis_report {

  file { '/opt/cis':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
  }
  file { '/opt/cis/scripts':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
  }
  file { 'generate_cis.sh':
    source => 'puppet:///modules/cis/generate_cis.sh',
    path   => '/opt/cis/scripts/generate_cis.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0744',
    notify => Exec['generate_cis'],
  }
  exec {
    'generate_cis':
    command     => '/opt/cis/scripts/generate_cis.sh',
    refreshonly => true,
  }
}
