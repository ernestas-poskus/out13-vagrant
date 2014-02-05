# --- Installing various useful tools ---------------------------------------------------------------
#
#

class install_tools($packages = [], $username = 'vagrant')
{

	$tools = concat(['htop', 'tree', 'vim', 'zsh', 'tmux'], $packages)

    package { $tools:
        ensure => present,
        require => Exec['out_apt_update'],
    }


    exec { "chsh -s /bin/zsh ${username}":
    	unless  => "grep -E '^${username}.+:/bin/zsh$' /etc/passwd",
		require => Package['zsh'];
    }


    include apt

    # Addding Tmux Apt Repository 
    apt::ppa { 'ppa:pi-rho/dev':
		before => Package['tmux'],
    }

}