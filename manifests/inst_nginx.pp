class inst_nginx {
  include nginx
  
  file { 'nginx config':
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    ensure    => file,
    path      => '/etc/nginx/conf.d/default.conf',
    source    => '/vagrant/master/nginx.conf',
    notify    => Service['nginx'],
  } 
}
