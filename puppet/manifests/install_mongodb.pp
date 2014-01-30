# --- MongoDB ---------------------------------------------------------------
#
# Sharding and Replication
# @Provider: git://github.com/puppetlabs/puppetlabs-mongodb.git
#
# @Usage: https://github.com/puppetlabs/puppetlabs-mongodb#usage
#

class install_mongodb($client_only = false, $mongo_orm_gem = false) {


	if $client_only
	{
		package { 'mongodb-clients':
			ensure 		=> present,
			require		=> Class['update_system::update_aptget'],
		}

		if $mongo_orm_gem
		{
			rvm_gem { 'mongo_orm_gem':
				name 			=> 'mongo_mapper',
				ruby_version 	=> $ruby_version_install,
				ensure 			=> latest,
				require 		=> [ Rvm_system_ruby[$ruby_version_install], Package['mongodb-clients'] ];
			}
		}

	}
	else 
	{
		$mongodb_user = 'vagrant'

		$mongo_base_dir = '/data'
		$mongo_db_path =  "${$mongo_base_dir}/db"
		
		class {'mongodb::server':
			ensure				=> true,	
			user 				=> $mongodb_user,
			group				=> $mongodb_user,
			bind_ip				=> [ "${ipaddress_eth1}", ], #['127.0.0.1', '192.168.130.1'],
	  		port    			=> "${mongo_port}",
	  		dbpath				=> $mongo_db_path,
	  		# logpath				=> $mongo_log_path,
	  		verbose 			=> true,
	  		noauth 				=> true, # Authentication disabled
	  		smallfiles			=> true, # Limits DB files to <= 512mb
	  		directoryperdb 		=> true, # Stores each database file in a distict folder
	  		nohttpinterface		=> false, # Disable http interface
	  		rest				=> false, # MongoDB Rest Interface
	  	}

	  	file { [ $mongo_base_dir ]:
		    ensure 				=> "directory",
		    owner  				=> $mongodb_user,
		    group  				=> $mongodb_user,
		    mode   				=> 777,
		    before 				=> Class['mongodb::server'],
		}

	}
}