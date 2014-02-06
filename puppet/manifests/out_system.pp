# --- Updates System ---------------------------------------------------------------------


class out_system
{
    # Binding relationship to update apt before installing every class
    class {'out_system::update': stage => preinstall } 

    # Spaceship relationship operator updates apt before installing package
	Exec['out_apt_update'] -> Package <| |>
}


class out_system::install_essential
{
	package { [ 'build-essential', 'curl', 'wget', 'git-core', 
                'autoconf', 'openssl', 'automake', 'libtool', 
                'pkg-config', 'bison', 'gawk', 'ncurses-dev', ]:
		require => Exec['out_apt_update'],
		ensure 	=> present,
	}
}


# Installing all essential libraries
class out_system::install_libraries
{
    package { [ 'libreadline6', 'libreadline6-dev', 'zlib1g-dev', 
                'libssl-dev', 'libyaml-dev', 'libxml2-dev', 'libffi-dev', 
                'libc6-dev', 'libgdbm-dev', ]: 
        require => Exec['out_apt_update'],
        ensure  => present,
    }
}
    

# Class for installing extra packages
class out_system::install_extra( $packages = [] )
{
    package { $packages: 
        require => Exec['out_apt_update'],
        ensure  => present,  
    }
}


# brings the system up-to-date after importing it with Vagrant
class out_system::update
{
    exec{'out_apt_update':
        command => 'apt-get update;',
        timeout => 0,
    }
}


# brings the system up-to-date after importing it with Vagrant
class out_system::upgrade
{
  exec { 'system_apt_upgrade':
        command => 'apt-get -y upgrade --fix-missing',
        timeout => 0,
        require => Exec['out_apt_update']
    }
}
