# puppet Master code

This is my puppet code as I develop my master.

To use:

   * Install your puppet master
   * move out the puppet directory (mv /etc/puppet /etc/puppet_ORIG
   * initialise git - git init (in /etc)
   * git clone my repo
   * git clone git@github.com:dmccuk/puppet.git
   * On your node, run puppet agent -t (I have got some test server names in my config)

---
Created a directory structure for production and development.

Added in Hiera.yaml configuration under hieradata/node
