# --- Node.js installation ---------------------------------------------------------------
#
# @Provider: git://github.com/willdurand/puppet-nodejs.git
#

class install_nodejs {

	class { 'nodejs':
	  version => 'v0.10.17',
	}
  
	package { 'express':
	  provider => npm
	}
  
  
}