# --- Installing various useful tools ---------------------------------------------------------------
#
#

class install_tools($packages = [])
{

    package { concat(['htop', 'tree'], $tools):
        ensure => present,
        require => Exec['aptupdate'],
    }
}