node 'master.puppet' {
  include inst_nginx
  include openport
}

node 'slave1.puppet' {
  include inst_apache
  include openport
}

node 'slave2.puppet' {
  include inst_apache_php
  include openport
}

node 'mineserver.puppet' {
  package { 'java 17':
    ensure => 'installed',
    source => 'https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm',
    provider => 'rpm'
  }
  include minecraftserver
}
