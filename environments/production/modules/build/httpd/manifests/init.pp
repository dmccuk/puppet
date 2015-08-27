class httpd {

  #notify { "This is the HTTPD module": }

  package{ 'httpd':
    ensure => present,
  }
  file{ "/var/www/html/index.html":
    ensure   => file,
    content  => template("$module_name/index.html.erb"),
  }
  service{ 'httpd':
    name => httpd,
    ensure => running,
    enable => true,
  }
}

