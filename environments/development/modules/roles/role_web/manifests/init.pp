# --- Class Role_web

class role_web {
  notify { 'This is ROLE WEB - Developement side': }

  include motd
  include httpd

}
