class inst_apache {
  include apache

  file { 'index.html':
   ensure => file,
   path   => "/var/www/html/index.html",
   source => "/vagrant/slave/index.html",
   notify    => Service['httpd'],
 }
}
