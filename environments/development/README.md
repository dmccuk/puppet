<<<<<<< HEAD
Base Puppet code
=======
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
   * To use hiera, create yourself your own fqdn.yaml file and look at the ones already there as examples.
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
>>>>>>> cad1b08d0a136f420ff5814d7d2870084ff4d47e
