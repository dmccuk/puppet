#
class grub::redhat6 (

  # Initial setting of the password. This password is changed in Hiera. 
  $grub_password = '$1$0p3Ng$Zj/tdn/UOaVQLpKAaNBzk/', #sets to P@ssword

) {
  file_line{'/boot/grub/grub.conf password':
    path  => '/boot/grub/grub.conf',
    line  => "password --encrypted $grub_password",
    match => '^password',
  }
}
