node 'master.puppet' {
  package {
    'nginx':
        name => nginx,
        ensure => installed,
  }
-> nginx::resource::server { 'static':
  listen_port => 80,
  proxy       => 'http://192.168.34.11',
}
-> nginx::resource::server { 'dynamic':
  listen_port => 81,
  proxy       => 'http://192.168.34.12',
}
}
node 'slave1.puppet' {
  package {
    'httpd':
        name => httpd,
        ensure => installed,
  }
-> file { 'index.html':
          ensure => file,
          path   => "/var/www/html/index.html",
          source => "/vagrant/slave/index.html"
 }
~> service {
    'httpd':
        ensure => true,
        enable => true,
  }
}

node 'slave2.puppet' {
  package {
    'httpd':
        name => httpd,
        ensure => installed,
  }
  -> package {
    'php':
        name => php,
        ensure => installed,
  }
-> file { 'index.php':
          ensure => file,
          path   => "/var/www/html/index.php",
          source => "/vagrant/slave/index.php"
 }
~> service {
    'httpd':
        ensure => true,
        enable => true,
  }
}
