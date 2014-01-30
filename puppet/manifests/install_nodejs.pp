# --- Node.js installation ---------------------------------------------------------------
#
#

class install_nodejs($npm_package = undef, $version = 'present')
{
	
	class { 'nodejs':
  		version 	=> $version,
  		manage_repo => true,
  	}

	if $npm_package != undef 
	{
		package { $npm_package:
	  		provider => npm,
	  		require	=> Class['nodejs'];
		}
    }

}