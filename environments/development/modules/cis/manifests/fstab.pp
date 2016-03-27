# Class: cis::fstab
# ===========================
#
# Full description of class cis_fs here.
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
#    class { 'cis_fs':
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
class cis::fstab {

  file {'/etc/fstab':
    owner => root,
    group => root,
    mode  => '0644',
  }

  # 1.1.1/2/3 Add nodev,nosuid,noexec Option to /tmp Partition
  mount { '/tmp':
    device  => '/dev/mapper/vg_root-lv_tmp',
    fstype  => 'ext4',
    options => 'defaults,nodev,nosuid,noexec',
    pass    => '2',
    dump    => '1',
  }
  # 1.1.8 Add nodev Option to /home
  mount { '/home':
    device  => '/dev/mapper/vg_root-lv_home',
    fstype  => 'ext4',
    options => 'defaults,nodev',
    pass    => '2',
    dump    => '1',
  }
  # 1.1.12/13/14 Add nodev,nosuid,noexec Option to /dev/shm Partition
  mount { '/dev/shm':
    device  => 'tmpfs',
    fstype  => 'tmpfs',
    options => 'defaults,nodev,nosuid,noexec',
    pass    => '2',
    dump    => '1',
  }
  # 1.1.5 Bind Mount the /var/tmp directory to /tmp
  mount { '/var/tmp':
    ensure  => 'mounted',
    device  => '/tmp',
    fstype  => 'none',
    options => 'bind',
  }

}
