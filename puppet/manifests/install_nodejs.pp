# --- Node.js installation ---------------------------------------------------------------
#
#


class install_nodejs($npm_package = undef, $version = 'present')
{
	class { 'nodejs':
		version 	=> $version,
		manage_repo => true,
	}

	package { $npm_package:
		provider => npm,
	}
}