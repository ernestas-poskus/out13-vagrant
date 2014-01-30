# --- Updates System ---------------------------------------------------------------------

class update_system
    (
        $install_specific_packages = [],
        $install_depending_libraries = [],
    ) 
{
    # Spaceship relationship operator updates apt before installing package
	Exec['aptupdate'] -> Package <| |>

    # Binding relationship to update apt before installing every class
    class {'update_system::update_aptget': stage => preinstall}


    $install_base = concat(['build-essential', 'curl', 'wget', 'git-core', 'autoconf', 'openssl', 
            'automake', 'libtool', 'pkg-config', 'bison', 'gawk', 'ncurses-dev', ], $install_specific_packages)

    $install_libraries = concat([ 'libreadline6', 'libreadline6-dev', 'zlib1g-dev', 'libssl-dev', 
            'libyaml-dev', 'libxml2-dev', 'libffi-dev', 'libc6-dev', 'libgdbm-dev', ], $install_depending_libraries)


    package { $install_base:
        require => Exec['aptupdate'],
        ensure  => present,
    }
    
    package { $install_libraries:
        require => Exec['aptupdate'],
        ensure  => present,
    }
}


# brings the system up-to-date after importing it with Vagrant
class update_system::update_aptget
{
    exec{'aptupdate':
        # command => 'apt-get -y autoremove; apt-get -y autoclean; apt-get  -y -f install; apt-get update;',
        command => 'apt-get update;',
        # command => 'apt-get --yes --show-upgraded --fix-broken --verbose-versions update',
        timeout => 0
    }
}

# brings the system up-to-date after importing it with Vagrant
class update_system::upgrade_aptget
{
  exec { 'aptupgrade':
        command => 'apt-get -y upgrade --fix-missing',
        timeout => 0,
        require => Exec['aptupdate']
    }
}