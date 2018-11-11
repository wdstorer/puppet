class motd {
  file { '/etc/update-motd.d/99-banner-art':
    ensure   => present,
    mode     => '0755',
    source  => 'puppet:///modules/motd/99-banner-art',
  }
  file { '/etc/motd':
    ensure   => present,
    mode     => '0644',
    content  => '',
  }
}
