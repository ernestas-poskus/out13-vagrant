# --- Installing ZSH & oh-my-zsh  ---------------------------------------------------------------
#
#

class install_zsh($oh_my = true, $username = 'vagrant')
{
    package { 'zsh':
        ensure => present,
        require => [ Exec['out_apt_update'], Package['git-core'] ],
    }

	$home_path = "/home/${username}/"

	if $oh_my
	{
		# Changing to User shell to ZSH
		user { "zsh_user_${username}":
			ensure  => present,
			name    => $username,
			shell   => '/usr/bin/zsh',
			require => Package['zsh']
		}
		
		exec { 'clone_oh_my_zsh':
			command => "git clone git://github.com/ernestas-poskus/oh-my-zsh.git ${home_path}.oh-my-zsh",
			creates => "${home_path}.oh-my-zsh",
			user 	=> $username,
			unless  => "ls ${home_path}.oh-my-zsh",
			require => User["zsh_user_${username}"] 
		}

		exec { 'copy-zshrc':
			command => "cp ${home_path}.oh-my-zsh/dotfiles/.zshrc ${home_path}.zshrc",
			user 	=> $username,
			require => Exec['clone_oh_my_zsh'],
		}
	}
}