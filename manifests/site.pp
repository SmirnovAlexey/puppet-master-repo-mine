node 'master.puppet' {
  include inst_nginx
}

node 'slave1.puppet' {
  include inst_apache
}

node 'slave2.puppet' {
  include inst_apache_php
}

node 'mineserver.puppet' {
  include minecraftserver
}
