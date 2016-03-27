<<<<<<< HEAD
#

=======
>>>>>>> cad1b08d0a136f420ff5814d7d2870084ff4d47e
Package {
  allow_virtual => false
}

<<<<<<< HEAD
node default {
  include auto
}

=======
hiera_include('classes')

node "puppet-node02.mydomain.com", "test-node01.mydomain.com" {
      include ntp
      class { "motd": }
      # or:
      # class { "ntp": }
}
>>>>>>> cad1b08d0a136f420ff5814d7d2870084ff4d47e
