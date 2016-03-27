# ---> Class Httpd

class httpd (

  $index_content  = undef,
  
) {

  package { 'httpd':
    ensure => present,
  } ->

  service { 'httpd':
    ensure => running,
    enable => true,
  } ~>

file { '/var/www/html':
    ensure => directory,
    owner  => 'apache',
    group  => 'apache',
    mode   => '0640',
  }

  file { '/var/www/html/index.html':
    ensure    => file,
    content   => template('httpd/index.html.erb'),
    require   => Package['httpd'],
    subscribe => Service['httpd'],
  }

  file_line { 'index.html':
    path  => '/var/www/html/index.html',
    line  => $index_content,
    match => 'WEBSITE',
  }
}

