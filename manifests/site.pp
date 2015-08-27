Package {
  allow_virtual => false
}

hiera_include('classes')

node "puppet-node02.mydomain.com", "test-node01.mydomain.com" {
      include ntp
      class { "motd": }
      # or:
      # class { "ntp": }
}
