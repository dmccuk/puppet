Package {
  allow_virtual => false
}

node "puppet-node02.mydomain.com", "test-node01.mydomain.com" {
      include ntp
      include motd
      # or:
      # class { "ntp": }
}

hiera_include('classes')

