#midnight_commander::install

node "vmdev1" {

  package {'mc':
    #require => Exec['apt-update'],
    ensure => installed,
  }

}

file { '/tmp/test':
  ensure => present,
  content => "ZA bozic pa tole",
}
