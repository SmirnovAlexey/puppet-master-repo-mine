class openport {
    class { 'firewall': }
    firewall { '100 open tcp port 80':
      port => 80,
      proto => 'tcp',
      action => 'accept',
    }
}
