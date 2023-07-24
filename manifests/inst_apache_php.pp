class inst_apache_php {
  include apache
  class { 'apache::mod::php': }

  file { 'index.php':
   ensure => file,
   path   => "/var/www/html/index.php",
   source => "/vagrant/slave/index.php",
   notify => Service['httpd'],
 }
}
