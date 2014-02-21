# --- Nodes ---------------------------------------------------------------------

# Default Node for Global VM dependencies
node default
{ 

} 


node 'mm'
{
	import 'install_nginx.pp'
	import 'install_ruby.pp'
	import 'install_nodejs.pp'
	import 'install_redis.pp'
	import 'install_mongodb.pp'	
	# import 'install_elasticsearch.pp'

	class {'install_nodejs':  
	  npm_package => ['coffee-script', 'bower', ] 
	}
	->
		# class { 'install_elasticsearch': }
		# ->
			class {'install_ruby':
			  gems => ['bundler', 'rails', 'redis', 'mongo_mapper', ]#'elasticsearch'] 
			}
			->
				class { 'install_nginx': }
				->
					class { 'install_mongodb': } 

	class { 'install_redis': }					
}


node 'mp'
{
	import 'install_nginx.pp'
	import 'install_ruby.pp'
	import 'install_nodejs.pp'
	import 'install_redis.pp'
	import 'install_postgres.pp'

	class {'install_nodejs':  
	  npm_package => ['coffee-script', 'bower', ] 
	}
	->
		class {'install_ruby':
		  gems => ['bundler', 'rails', 'redis' ] 
		}
		->
			class { 'install_nginx': }
			->
				class { 'install_redis': }
				->
					class { 'install_postgres::client': }
}


# Node for JavaScript development with `node`
node 'js'
{
	import 'install_mongodb.pp'
	import 'install_nodejs.pp'

	class { 'install_mongodb': }
	->
		class {'install_nodejs':
		  npm_package => [
		  	'mongodb', 'commander', 'express', 'consolidate', 'bcrypt-nodejs',
		  	'coffee-script', 'underscore', 'swig', 'validator', 'bower',
		  ]
		}
}


# Node for Python applications
node 'py'
{
	import 'install_python.pp'
	import 'install_mongodb.pp'

	class { 'install_python': }
	->
		class { 'install_mongodb': }
}


# Node for `remote` database connection / replication / sharding - set
node 'db'
{
	import 'install_postgres.pp'
	include install_postgres

	import 'install_mongodb.pp'
	class { 'install_mongodb': ips => ["${ipaddress_eth1}", ] }
}