# --- Installing ZSH & oh-my-zsh  ---------------------------------------------------------------
#
#


class install_zsh( $username = 'vagrant')
{
  package { 'zsh':
	  ensure => present,
    require => [ Exec['out_apt_update'], Package['git-core'] ],
  }

	user { "zsh_user_${username}":
		ensure  => present,
		name    => $username,
		shell   => '/usr/bin/zsh',
		require => Package['zsh']
	}
}