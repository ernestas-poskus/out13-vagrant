# --- MongoDB ---------------------------------------------------------------
#
# @Provider: git://github.com/puppetlabs/puppetlabs-mongodb.git
#

class install_mongodb {

  class {'::mongodb::globals':
	manage_package_repo => true,
  }->
  class {'::mongodb::server':
  	port    => 27018,
  	verbose => true,
  }

}


# Sharding and Replication
# https://github.com/puppetlabs/puppetlabs-mongodb