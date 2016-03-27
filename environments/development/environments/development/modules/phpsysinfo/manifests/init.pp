# == Class: phpsysinfo
#
# Full description of class phpsysinfo here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'phpsysinfo':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class phpsysinfo {

  include profile_apache

  package { ['php', 'php-xml', 'php-mbstring']:
    ensure => present,
  }

  file { '/var/www/html/phpsysinfo1.tar.gz':
    require => Exec['get_phpsysinfo1']
  }

  exec { 'get_phpsysinfo1':
    command => '/usr/bin/wget -q https://github.com/phpsysinfo/phpsysinfo/archive/v3.1.13.tar.gz -O /var/www/html/phpsysinfo1.tar.gz ; cd /var/www/html; /bin/tar -zxf phpsysinfo1.tar.gz ; /bin/ln -sf phpsysinfo-3.1.13 phpsysinfo ; /bin/cp phpsysinfo/phpsysinfo.ini.new phpsysinfo/phpsysinfo.ini',
    creates => '/var/www/html/phpsysinfo1tar.gz',
    require => Package['php-mbstring', 'php', 'php-xml'],
    path    => '/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin',
  }
}
