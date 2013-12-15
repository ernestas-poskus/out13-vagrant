# --- PostgreSQL ---------------------------------------------------------------

class install_postgres {

	class {'postgresql': }
	class {'postgresql::server':
		version => '9.1',
	}
	
	
}