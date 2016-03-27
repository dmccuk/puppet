#
class cis::login_defs {

  # 7.1.1 Set Password Expiration Days
  file_line{'/etc/login.defs Set_Password_Expiration_days':
    path  => '/etc/login.defs',
    line  => 'PASS_MAX_DAYS 90',
    match => '^PASS_MAX_DAYS',
  }
  # 7.1.2 Set Password Change Minimum Number of Days
  file_line{'/etc/login.defs Set_Password_Expiration_Warning_days':
    path  => '/etc/login.defs',
    line  => 'PASS_MIN_DAYS 7',
    match => '^PASS_MIN_DAYS',
  }
}
