class inst_apache_php {
  include apache
  class { 'apache::mod::php':
    php_version => '7.2'
  }

  file { 'index.php':
   ensure => file,
   path   => "/var/www/html/index.php",
   source => "/vagrant/slave/index.php",
   notify => Service['httpd'],
 }
}
