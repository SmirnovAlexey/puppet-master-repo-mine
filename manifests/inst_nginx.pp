class inst_nginx {
  include nginx
  nginx::resource::location { "static":
    server         => 'localhost',
    ensure         => present,
    location       => '/static',
    fastcgi        => "192.168.33.10",
  } 
  nginx::resource::location { "dynamic":
    server         => 'localhost',
    ensure         => present,
    location       => '/dynamic',
    fastcgi        => "192.168.33.11",
  } 
}
