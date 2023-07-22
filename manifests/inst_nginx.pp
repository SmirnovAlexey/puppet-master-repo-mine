class inst_nginx {
  include nginx
  nginx::resource::location { "static":
    server         => 'default',
    ensure         => present,
    location       => '/static',
    fastcgi        => "192.168.33.10",
  } 
  nginx::resource::location { "dynamic":
    server         => 'default',
    ensure         => present,
    location       => '/dynamic',
    fastcgi        => "192.168.33.11",
  } 
}
