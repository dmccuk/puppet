# configure an array in $scopy containing a list of user lists to load.
# due to how puppet merges arrays, a list of users/groups/keys 

class users (
  $scope = [
    hiera('users::scope', [
      'default',
      'sysadmins',
      $::fqdn,
      $::domain,
#     $::nodetype,
      ]
    )
  ]
) {

  users::configure { $scope: }
}
