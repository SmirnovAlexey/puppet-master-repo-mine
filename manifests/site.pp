node 'master.puppet' {
  package {
    'nginx':
        name => nginx,
        ensure => installed,
  }
->   file {
    'nginx config':
      owner     => 'root',
      group     => 'root',
      mode      => '0644',
      path      => '/etc/nginx/nginx.conf',
      content   => 'vagrant/slave/nginx.conf';
 }
~> service {
    'nginx':
        ensure => true,
        enable => true,
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
