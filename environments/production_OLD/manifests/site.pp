
notify { 'This is the production Site.pp - Den': }

Package {
  allow_virtual => false
}

node default {
  include role_web
  include '::ntp'
}

