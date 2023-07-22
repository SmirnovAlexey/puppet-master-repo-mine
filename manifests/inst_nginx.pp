class inst_nginx {
  include nginx
  ->
  nginx::resource::location { "static":
    ensure         => present,
    location       => '/static',
    fastcgi        => "192.168.33.10",
  } 
  ->
  nginx::resource::location { "dynamic":
    ensure         => present,
    location       => '/dynamic',
    fastcgi        => "192.168.33.11",
  } 
}
