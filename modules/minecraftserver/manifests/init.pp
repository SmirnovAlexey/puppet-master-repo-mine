class minecraftserver {

  file { 'java 17 rpm':
    path => "/opt/minecraft/java-17.rpm",
    source => "https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm",
  } ->
  package { 'java 17':
    name => '/opt/minecraft/java-17.rpm',
    ensure => 'installed',
    provider => 'dnf'
  }  
  
  file { '/opt/minecraft':
    ensure => directory,
    before => File['minecraft'],
  }

  file { 'minecraft':
    path => "/opt/minecraft/server.jar",
    source => "https://piston-data.mojang.com/v1/objects/84194a2f286ef7c14ed7ce0090dba59902951553/server.jar",
    mode => "755",
    require => File['/opt/minecraft'],
  }

  file { 'eula.txt':
    path => "/opt/minecraft/eula.txt",
    source => "puppet:///modules/minecraftserver/eula.txt",
    notify => Service['minecraft'],
  }

  file { 'minecraft_service':
    path => "/etc/systemd/system/minecraftserver.service",
    source => "puppet:///modules/minecraftserver/minecraftserver.service",
    notify => Service['minecraft'],
  }

  service { 'minecraft':
    name => 'minecraftserver',
    ensure => running,
    enable => true,
    require => [File['minecraft', 'minecraft_service', 'eula.txt'], Package['java 17'],],
  }

}
