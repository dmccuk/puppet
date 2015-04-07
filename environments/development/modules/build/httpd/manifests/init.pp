# ---> Class Httpd

class httpd {

  notify { 'This is the HTTPD module - Dev side': }

  package { 'httpd':
    ensure => present,
  }

  service { 'httpd':
    ensure => running,
    enable => true,
  }
}

