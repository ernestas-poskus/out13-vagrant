# --- Node.js installation ---------------------------------------------------------------

class install_nodejs {

	class { 'nodejs':
	  version => 'v0.10.17',
	}
  
	package { 'express':
	  provider => npm
	}
  
  
}