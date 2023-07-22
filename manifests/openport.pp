class openport (
  $port = 80
) {
    class { 'firewall': }
    firewall { "open tcp port $port":
      port => $port,
      proto => 'tcp',
      action => 'accept',
    }
}
