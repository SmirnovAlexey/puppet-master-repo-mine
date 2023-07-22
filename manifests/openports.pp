class openports {
    class { 'firewall': }
    firewall { '100 open tcp port 80':
      port => 80,
      proto => 'tcp',
      action => 'accept',
    }
    firewall { '100 open tcp port 8081':
      port => 8081,
      proto => 'tcp',
      action => 'accept',
    }
    firewall { '100 open tcp port 8082':
      port => 8082,
      proto => 'tcp',
      action => 'accept',
    }
}
