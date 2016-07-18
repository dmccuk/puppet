Package {
  allow_virtual => false
}

node default {
  include auto
}

hiera_include('classes')

