---
classes:
 - role_basic

ntp::servers:
 - 0.centos.pool.ntp.org iburst
 - 1.centos.pool.ntp.org iburst
 - 2.centos.pool.ntp.org iburst

ntp::restrict:
 - 127.0.0.1

ntp::broadcastclient: true

