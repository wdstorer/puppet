node default {
  file { '/tmp/testfile':
    ensure   => present,
    mode     => '0444',
    content  => 'test content',
  }

  class { 'sudo': }
  class { 'privileges': }

  group { 'sysadmin':
    ensure => 'present',
    gid    => '2000',
  }

  group { 'william':
    ensure => 'present',
    gid    => '1001',
  }
  user { 'william':
    ensure           => 'present',
    managehome       => 'true',
    gid              => '1001',
    home             => '/home/william',
    comment          => 'Will Storer',
    groups           => 'sysadmin',
    shell            => '/bin/bash',
    uid              => '1001',
  }
  ssh_authorized_key { 'Desktop PC':
    ensure => present,
    user   => 'william',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDoYwU9wIjDYXCugTb7XMiad7Y59QUkgK5oHzR/esDECkb3P1w6ACsapAwhwMkPq3PzvDL9o7j2Ra7k2BJCV4pOZ/4dhbYbH3JaCpQydqnx55s0pirX5DKmJmQ1R1oXOHMStUYIzYXcarNJ4RpSxrt8rv7ccRiKRuMcjNQQxK2Qc41baD2/2Wbnwyp8ekGwAelLiWerLUyM05Blmf6B0h/Oofr5Dr3m07wmkGN2bnQ6t1aa+d1pK8pO/HBj4Q0y06PQnnz88EHXrbgsfROr/tmhbcv8uCk27Izd74vGTBPNST8x/S9Zv81z06n9dTksMcZX1AbVxCEkcBkd5I3+QaHP',
  }
}
