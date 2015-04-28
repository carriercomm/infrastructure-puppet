# /etc/puppet/modules/spamassassin/manifests/smapc.pp

class spamassassin::spamc (

  $spamd_peers           = '',
  $haproxy_maxconns      = '',
  $haproxy_port          = '',
  $haproxy_mode          = 'tcp',
  $haproxy_statsuser     = '',
  $haproxy_statspassword = '',

) {

  include haproxy

  class { "spamassassin::spamc::install::${::asfosname}::${::asfosrelease}":
    spamd_peers           => $spamd_peers,
    haproxy_maxconns      => $haproxy_maxconns,
    haproxy_port          => $haproxy_port,
    haproxy_mode          => $haproxy_mode,
    haproxy_statsuser     => $haproxy_statsuser,
    haproxy_statspassword => $haproxy_statspassword,
  }
}
