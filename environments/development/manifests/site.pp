Package {
  allow_virtual => false
}

node default {
  include auto
}

hiera_include('classes')

node "puppet-node02.mydomain.com", "test-node01.mydomain.com" {
      include ntp
      class { "motd": }
      # or:
      # class { "ntp": }
}
