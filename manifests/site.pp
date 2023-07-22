node 'master.puppet' {
  include inst_nginx
  include openport
}
node 'slave1.puppet' {
  include inst_apache
  include openport
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
