# puppet Master code

Recent code rebase to replicate how Satellite 6 manages the puppet code.

I've added basic modules for sshd_config, users, a webserver app and phpsysinfo. Lots of examples of how to code.

To use:

   * Install your puppet master
   * move out the puppet directory (mv /etc/puppet /etc/puppet_ORIG
   * initialise git - git init (in /etc)
   * git clone my repo
      * git clone git@github.com:dmccuk/puppet.git
   * On your node, update your /etc/puppet/puppet.conf file to point to "your" puppet master, then run "puppet agent -t" (I have got some test server names in my config)
   * To use hiera I've added some data to mine but feel free to change it. You will need to update your /etc/hiera.yaml file to point to the hieradata directory.
   * Enjoy.

---

Added in Hiera.yaml configuration under hieradata/node

Here is my hiera file. Very basic but you get the idea.

---
	:backends:
	  - yaml
	:yaml:
	  :datadir: /etc/puppet/hieradata
	:hierarchy:
	  - "node/%{::fqdn}"
	  - common
	  - users

  To make hieradata follow my environments (Directory Environments) I'll need to update this line like this:
  (e.g. :datadir: /etc/puppet/environments/%{::environment}/hieradata)

  This way the local variables being used won't need to be added into the main hieradata location to test the code. The local variables will be picked up as part of the run.

Here is my common.yaml (update as required)

    ---
    classes:
     - role_basic
    
    grub::redhat6::grub_password:
     - '$1$0p3Ng$Zj/tdn/UOaVQLpKAaNBzk/'
    
    ntp::servers:
     - 0.centos.pool.ntp.org iburst
     - 1.centos.pool.ntp.org iburst
    
    ntp::restrict:
     - 127.0.0.1
    
    ntp::broadcastclient: true
    
---
Here is my users.yaml (Update as required)

    ################################################
    # https://github.com/greenaar/puppet-hiera_users
    ################################################
    
    # group creation
    users::configure::groups_default:
      sysadmins:
        ensure: present
        gid: 1010
      logging:
        ensure: present
        gid: 1011
    
    # user creation
    users::configure::users_default:
      first.last:
        ensure: present
        managehome: true
        shell: /bin/bash
        uid: 5000
        groups: [ 'sysadmins', 'logging', 'wheel' ]
        password: password
        ssh_authorized_keys:
          first.last@server.name:
            ensure: present
            key: KeyG0esHere!!
            options:
            type: ssh-rsa
    ################################################


