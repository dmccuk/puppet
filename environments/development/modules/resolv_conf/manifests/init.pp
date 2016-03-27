# Class: resolv_conf
# ===========================
#
# Full description of class resolv_conf here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'resolv_conf':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class resolv_conf (
  $domain     = $resolv_conf::params::domain,
  $search     = $resolv_conf::params::search,
  $nameserver = $resolv_conf::params::nameserver,
  $timeout    = $resolv_conf::params::timeout,
  $attempts   = $resolv_conf::params::attempts,
  $rotate     = $resolv_conf::params::rotate)
  inherits resolv_conf::params
{
  $resolv_conf_file  = $resolv_conf::params::resolv_conf_file
  $resolv_conf_group = $resolv_conf::params::resolv_conf_group

  file { $resolv_conf_file:
    ensure  => present,
    backup  => true,
    path    => $resolv_conf_file,
    owner   => 'root',
    group   => $resolv_conf_group,
    mode    => '0644',
    content => template('resolv_conf/resolv.conf.erb'),
  }

}
