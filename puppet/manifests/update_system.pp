# --- Updates System ---------------------------------------------------------------------

class update_system 
{
	notify {"Updating System....":}

	Exec['aptupdate'] -> Package <| |>
    class {'basic::update_aptget': stage => preinstall} ->
    class {'basic::upgrade_aptget':} ->
    class {'basic::packages':}

	notify {"System update complete":}
}

# just some packages
class basic::packages{
	package { [ 'build-essential', 'openssl', 'curl', 'wget', 'git-core']:
        require => Exec['aptupgrade'],
        ensure => present
    }
	# Nokogiri dependencies (Rails)
	package { [ 'libxml2', 'libxml2-dev', 'ncurses-dev', 'libxslt1-dev', 'libc6-dev',  'libyaml-dev']:
        require => Exec['aptupgrade'],
        ensure => present
    }
	
	package { ['zlib1g', 'zlib1g-dev', 'libpq-dev', 'libssl-dev', 'libreadline-gplv2-dev', 'ssh', 'aptitude' ]:
        require => Exec['aptupgrade'],
        ensure => present
    }
}

# brings the system up-to-date after importing it with Vagrant
class basic::update_aptget{

    exec{'aptupdate':
        command => 'apt-get -y autoremove; apt-get -y autoclean; apt-get  -y -f install; apt-get update;',
        timeout => 0
    }
}

# brings the system up-to-date after importing it with Vagrant
class basic::upgrade_aptget{
  exec { 'aptupgrade':
        command => 'apt-get -y upgrade --fix-missing',
        timeout => 0,
        require => Exec['aptupdate']
    }
}