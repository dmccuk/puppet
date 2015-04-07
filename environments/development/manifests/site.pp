#
notify { 'This is the Development Site.pp': }

Package {
  allow_virtual => false
}

node default {
  include role_web
}

