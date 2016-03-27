#
class cis::pam {

  # 6.5 Restrict Access to the su Command
  file_line{'/etc/pam.d/su pam_cracklib.so_minlength':
    path  => '/etc/pam.d/su',
    line  => 'auth           required        pam_wheel.so use_uid',
    match => '^auth           required        pam_wheel.so',
  }

}
