class openport {
    class { 'firewall': }
    firewall { '100 open tcp port 80':
      port => 80,
      proto => 'tcp',
      action => 'accept',
    }
    firewall { '100 open tcp port 81':
      port => 81,
      proto => 'tcp',
      action => 'accept',
    }
    firewall { '100 open tcp port 82':
      port => 82,
      proto => 'tcp',
      action => 'accept',
    }
}
