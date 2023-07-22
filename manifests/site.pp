node 'master.puppet' {
  include nginx
  ->
  file { 'nginx config':
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    ensure    => file,
    path      => '/etc/nginx/nginx.conf',
    source    => '/vagrant/master/nginx.conf',
  }
  ->
  class { 'firewall': }
  ->
  firewall { 'allow port 80/tcp':
    dport    => 80,
    proto    => 'tcp',
    action   => 'accept',
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
