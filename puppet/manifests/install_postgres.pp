# --- PostgreSQL ---------------------------------------------------------------
#
# @Provider: git://github.com/akumria/puppet-postgresql
#

class install_postgres {

	class {'postgresql': }
	class {'postgresql::server':
		version => '9.1',
	}
	
	postgresql::db { 'vagrant':
		password => 'vagrant',
	}
	
}