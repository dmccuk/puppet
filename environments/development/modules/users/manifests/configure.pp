#users::configure::users_default:
#  user1:
#    ensure: present
#    home: /path/to/home
#    shell: /path/to/shell
#    uid: 10001
#    gid: 10001
#    groups:
#      - secondary_group1
#      - secondary_group2
#    password: SuperSecret # http://razius.com/articles/generating-password-hashes-for-puppet/
#    ssh_authorized_keys:
#      key-1-user:
#        ensure: present
#        key: PUBLIC KEY HERE
#        options: ssh options, if any
#        user: joe
#        type: ssh-rsa
#  user2:
#    ensure: present
#    home: /path/to/home
#    shell: /path/to/shell
#    uid: 10002
#    gid: 10002
#    groups:
#      - secondary_group1
#      - secondary_group3
#    password: OtherSuperSecret
#  user3:
#    ensure: present
#    home: /path/to/home
#    shell: /path/to/shell
#    uid: 10003
#    gid: 10003
#    groups:
#      - secondary_group2
#      - secondary_group4
#    password: AlsoSuperSecret
#users::configure::_groups:
#  group1:
#    ensure: present
#    gid: 401
#  group2:
#    ensure: present
#    gid: 402
#  group3:
#    ensure: present
#    gid: 403

define users::configure (
  $_users  = hiera_hash("users::configure::users_${name}", undef),
  $_groups = hiera_hash("users::configure::groups_${name}", undef),
) {
  if $_groups {
    $groups = keys($_groups)
    users::configure::groups {
      $groups:
        data => $_groups;
    }
  }

  if $_users {
    $users = keys($_users)
    users::configure::users {
      $users:
        data => $_users;
    }
  }
}

