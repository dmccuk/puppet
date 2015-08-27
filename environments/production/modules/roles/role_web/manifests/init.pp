class role_web { 
  notify {"This is ROLE WEB": }

  include httpd
  include motd
}
