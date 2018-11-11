class sysadmins {

  #create admin groups
  group { 'sysadmin':
    ensure => 'present',
    gid    => '2000',
  }

  # configure sudo
  sudo::conf { 'sysadmin':
    ensure  => present,
    content => '%sysadmin ALL=(ALL) NOPASSWD: ALL',
  }
  sudo::conf { 'pi':
    ensure  => present,
    content => 'pi ALL=(ALL) NOPASSWD: ALL',
  }

  # create administrators
  group { 'william':
    ensure => 'present',
    gid    => '1001',
  }
  user { 'william':
    ensure           => 'present',
    managehome       => 'true',
    gid              => '1001',
    home             => '/home/william',
    comment          => 'Will',
    groups           => ['sysadmin','staff'],
    shell            => '/bin/bash',
    uid              => '1001',
  }
  ssh_authorized_key { 'Desktop PC':                                                                                                                      ensure => present,
    user   => 'william',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDoYwU9wIjDYXCugTb7XMiad7Y59QUkgK5oHzR/esDECkb3P1w6ACsapAwhwMkPq3PzvDL9o7j2Ra7k2BJCV4pOZ/4dhbYbH3JaCpQydqnx55s0pirX5DKmJmQ1R1oXOHMStUYIzYXcarNJ4RpSxrt8rv7ccRiKRuMcjNQQxK2Qc41baD2/2Wbnwyp8ekGwAelLiWerLUyM05Blmf6B0h/Oofr5Dr3m07wmkGN2bnQ6t1aa+d1pK8pO/HBj4Q0y06PQnnz88EHXrbgsfROr/tmhbcv8uCk27Izd74vGTBPNST8x/S9Zv81z06n9dTksMcZX1AbVxCEkcBkd5I3+QaHP',
  }

  group { 'chuhead':
    ensure => 'present',
    gid    => '1002',
  }
  user { 'chuhead':
    ensure           => 'present',
    managehome       => 'true',
    gid              => '1002',
    home             => '/home/chuhead',
    comment          => 'Jessica',
    groups           => ['staff'],
    shell            => '/bin/bash',
    uid              => '1002',
  }
  ssh_authorized_key { 'Lucy':
    ensure => present,
    user   => 'chuhead',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDg7+X/xY7uo4odx2LESIqbl2Jyq2qz2fORJqKk+ZJBRw7RSQK/Mm7zBCCMlTpsB3Jgh6mVVpWwyKDfh/gYTq7a9XpA4/Sw1+qDBhGNygZwF5MMo9r9gbRf7phlaiFLGhDKNIjoIRF67brHxqunYp8BXob/C6fjn+M2H298fdr/kawPfqI9hB+T/qZWwMttp6ibk/RGQ6wtXKzR6BmhxprpF3IkEE/pfpzRgj69IkEwcPWEyHxd0ZldHEXdR9/RIokk9r1slgdE5KcSA8PQ7tR7nqcVAhdrwyKc+B+ULI43GThx+eFU/HG9JHIiiK+VmKvy7cK6TeB4ocqQFORFjbnF',
  }
}
