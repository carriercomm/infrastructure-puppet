#/etc/puppet/modules/apbackup/manifests/backup.pp

class apbackup::backup (
  $ssh_key = '',
) inherits apbackup {

  cron { 'daily-www-push':
    minute  => 10,
    hour    => 1,
    command => "/home/apbackup/bin/daily-www-push.sh 2&1 | perl -lne 'print if $. < 10'", # lint:ignore:80chars
    require => User[$apbackup::username],
  }

  file { "/home/${apbackup::username}/.ssh":
    ensure  => directory,
    owner   => $apbackup::username,
    group   => $apbackup::groupname,
    mode    => '0700',
    require => User[$apbackup::username],
  }

  file { "/home/${apbackup::username}/.ssh/id_rsa":
    ensure  => file,
    owner   => $apbackup::username,
    group   => $apbackup::groupname,
    mode    => '0600',
    content => $ssh_key,
  }
}
