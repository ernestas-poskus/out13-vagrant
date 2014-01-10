# --- Updates System ---------------------------------------------------------------------

class update_system 
{
    # Spaceship relationship operator updates apt before installing package
	Exec['aptupdate'] -> Package <| |>
    class {'basic::update_aptget': stage => preinstall} ->
    class {'basic::upgrade_aptget':} ->
    class {'basic::packages':}
}

# just some packages
class basic::packages 
{
    $depending_packages = ['build-essential', 'curl', 'wget', 'git-core', 'autoconf', 'openssl', 'automake', 'libtool', 'pkg-config', 'bison', 'ncurses-dev' ]
    $depending_libraries = ['libreadline6', 'libreadline6-dev', 'zlib1g-dev', 'libssl-dev', 'libyaml-dev', 'libxml2-dev', 'libxslt-dev', 'libc6-dev' , 'libcurl4-openssl-dev'] 
    $sqlite_libraries = ['libsqlite3-0', 'libsqlite3-dev', 'sqlite3']
    $install_tools = ['htop'] # htop - process monitoring
    
    package { $depending_packages:
        require => Exec['aptupgrade'],
        ensure => present
    }

    package { $depending_libraries:
        require => Exec['aptupgrade'],
        ensure => present
    }
}

# brings the system up-to-date after importing it with Vagrant
class basic::update_aptget
{
    exec{'aptupdate':
        command => 'apt-get -y autoremove; apt-get -y autoclean; apt-get  -y -f install; apt-get update;',
        timeout => 0
    }
}

# brings the system up-to-date after importing it with Vagrant
class basic::upgrade_aptget
{
  exec { 'aptupgrade':
        command => 'apt-get -y upgrade --fix-missing',
        timeout => 0,
        require => Exec['aptupdate']
    }
}