# --- Installing ZSH & oh-my-zsh  ---------------------------------------------------------------
#
#

class install_zsh($dotfiles = true, $username = 'vagrant')
{
    package { 'zsh':
        ensure => present,
        require => [ Exec['out_apt_update'], Package['git-core'] ],
    }

	$home_path = "/home/${username}"
	
	$dotfiles_path = "${home_path}/dotfiles"

	if $dotfiles
	{
		# Changing to User shell to ZSH
		user { "zsh_user_${username}":
			ensure  => present,
			name    => $username,
			shell   => '/usr/bin/zsh',
			require => Package['zsh']
		}
		
		exec { 'clone_dot_files':
			command => "git clone git://github.com/ernestas-poskus/dotfiles.git ${dotfiles_path}",
			creates => "${dotfiles_path}",
			user 	=> $username,
			unless  => "ls ${dotfiles_path}",
			require => User["zsh_user_${username}"] 
		}
	}
}