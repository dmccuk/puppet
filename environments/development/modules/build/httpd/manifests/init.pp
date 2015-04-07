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
  file { '/var/www/html/index.html':
    ensure  => file,
    path    => '/var/www/html/index.html',
    content => template('httpd/index.html.erb'),
  }
}

