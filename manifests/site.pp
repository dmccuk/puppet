Package {
  allow_virtual => false
}

node "puppet-node02.mydomain.com" {
      include ntp
      # or:
      # class { "ntp": }
}

hiera_include('classes')

