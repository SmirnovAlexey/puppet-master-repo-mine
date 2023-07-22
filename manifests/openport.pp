class openport (
  $port = 80
) {
    class { 'firewall': }
    firewall { '100 open tcp port':
      port => $port,
      proto => 'tcp',
      action => 'accept',
    }
}
