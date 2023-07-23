class minecraftserver {

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

  file { 'minecraft_service':
    path => "/etc/systemd/system/minecraftserver.service",
    source => "puppet:///modules/minecraftserver/minecraftserver.service",
    notify => Service['minecraft'],
  }

  service { 'minecraft':
    ensure => running,
    require => File['minecraft_service', 'minecraft_service_sh'],
  }

}
