node default {
  file { '/tmp/testfile-partdeux':
    ensure   => present,
    mode     => '0444',
    content  => 'test content',
  }

  include tr0_common
}


