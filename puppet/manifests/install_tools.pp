# --- Installing various useful tools ---------------------------------------------------------------
#
#

class install_tools($packages = [])
{

	$tools = concat(['htop', 'tree', 'vim', 'tmux'], $packages)

    package { $tools:
        ensure => present,
        require => Exec['aptupdate'],
    }


    # Addding Tmux Apt Repository 
    apt::ppa { 'ppa:pi-rho/dev':
		before => Package['tmux'],
    }

}