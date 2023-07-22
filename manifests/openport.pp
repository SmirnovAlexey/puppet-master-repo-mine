class openport (
  $numport = 80
) {
    class { 'firewall': }
    firewall { '100 open tcp port':
      port => $numport,
      proto => 'tcp',
      action => 'accept',
    }
}
