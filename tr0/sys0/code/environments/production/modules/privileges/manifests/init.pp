class privileges {
  sudo::conf { 'sysadmin':
    ensure  => present,
    content => '%sysadmin ALL=(ALL) NOPASSWD: ALL',
  }
  sudo::conf { 'pi':
    ensure  => present,
    content => 'pi ALL=(ALL) NOPASSWD: ALL',
  }
}
