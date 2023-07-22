class inst_nginx {
  include nginx
  
  nginx::resource::server { 'static':
    listen_port => 8081,
    proxy       => 'http://192.168.33.11',
  } 
  
  nginx::resource::server { 'dynamic':
    listen_port => 8082,
    proxy       => 'http://192.168.33.12',
  } 
  
}
