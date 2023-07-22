class inst_nginx {
  include nginx

  file { 'nginx config':
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    ensure    => file,
    path      => '/etc/nginx/nginx.conf',
    source    => '/vagrant/master/nginx.conf',
  }
}