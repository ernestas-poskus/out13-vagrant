# --- Node.js installation ---------------------------------------------------------------
#
#

class install_nodejs {

	exec { "apt-get install npm":
		ensure => present,
	}

  	exec { "apt-get install nodejs":
  		ensure => present,
  	}
}