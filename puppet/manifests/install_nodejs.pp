# --- Node.js installation ---------------------------------------------------------------
#
# @Provider: git@github.com:puppetlabs/puppetlabs-nodejs.git
#

class install_nodejs {

	include nodejs
  
	package { 'express':
	  ensure   => present,
	  provider => 'npm',
	}

	package { 'mime':
	  ensure   => '1.2.4',
	  provider => 'npm',
	}
  
}