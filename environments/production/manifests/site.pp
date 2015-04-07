
notify { 'This is the production Site.pp': }

Package {
  allow_virtual => false
}

node default {
  include role_web
}

