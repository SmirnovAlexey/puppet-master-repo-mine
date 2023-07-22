node 'master.puppet' {
  include inst_nginx
  include openport
}
node 'slave1.puppet' {
  include inst_apache
  include openport
}

node 'slave2.puppet' {
  include inst_apache_php
  include openport
}
