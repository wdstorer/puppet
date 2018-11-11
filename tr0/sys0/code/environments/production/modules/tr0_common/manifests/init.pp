class tr0_common {
  include sysadmins
  include motd

  $packages = [ 'vim' ]
  package { $packages: ensure => 'installed' }
}
