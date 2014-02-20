# --- Adding Dot files ---------------------------------------------------------------
#
# @Provider: git@github.com:ernestas-poskus/dotfiles.git
#


class install_dotfiles($username = 'vagrant', $dotfiles = true )
{
	$dotfiles_path = "/home/${username}/dotfiles"
	
	if $dotfiles
	{
		exec { 'clone_dot_files':
			command => "git clone git://github.com/ernestas-poskus/dotfiles.git ${dotfiles_path}",
			creates => "${dotfiles_path}",
			user 	=> $username,
			unless  => "ls ${dotfiles_path}",
			require => Class['install_zsh'] 
		}
	}
}