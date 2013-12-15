# --- MongoDB ---------------------------------------------------------------


class install_mongodb {

	class {'::mongodb::globals':
		manage_package_repo => true,
	}->
	class {'::mongodb::server': }

}


# Sharding and Replication
# https://github.com/puppetlabs/puppetlabs-mongodb