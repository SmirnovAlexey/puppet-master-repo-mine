class minecraftserver {
  package { 'java 17':
    ensure => 'installed',
    source => 'https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm',
    name   => 'jdk-17_linux-x64_bin.rpm'
    provider => 'rpm'
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

  file { 'minecraft_service_sh':
    path => "/opt/minecraft/service.sh",
    mode => "755",
    source => "puppet:///modules/minecraftserver/service.sh",
    notify => Service['minecraft'],
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
    ensure => running,
    enable => true,
    require => [File['minecraft', 'minecraft_service', 'minecraft_service_sh', 'eula.txt'], Package['java 17'],],
  }

}
