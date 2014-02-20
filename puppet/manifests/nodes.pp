# --- Nodes ---------------------------------------------------------------------


# Default Node for Global VM dependencies
node default
{ 
	# Binding Stages
	class { 'out_system::update': stage => preinstall } 
	class { 'out_system::install_essential': stage => preinstall }

	# Installing Additional Tools
	class { 'install_tools': }
	class { 'install_dotfiles': }
	class { 'install_zsh': 
		stage => preinstall
	}
} 


node 'mm' inherits default
{
	import 'install_nginx.pp'
	import 'install_ruby.pp'
	import 'install_nodejs.pp'
	import 'install_redis.pp'
	import 'install_mongodb.pp'	
	import 'install_elasticsearch.pp'

	class {'install_nodejs':  
	  npm_package => ['coffee-script', 'bower', ] 
	}
	->
		class {'install_ruby':
		  gems => ['bundler', 'rails', 'redis', 'mongo_mapper', 'elasticsearch'] 
		}
		->
			class { 'install_nginx': }
			->
				class { 'install_redis': }
				->
					class { 'install_mongodb': } 
					->
						class { 'install_elasticsearch': }
}


node 'mp' inherits default
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
node 'js' inherits default 
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
node 'py' inherits default 
{
	import 'install_python.pp'
	import 'install_mongodb.pp'

	class { 'install_python': }
	->
		class { 'install_mongodb': }
}


# Node for `remote` database connection / replication / sharding - set
node 'db' inherits default
{
	import 'install_postgres.pp'
	include install_postgres

	import 'install_mongodb.pp'
	class { 'install_mongodb': ips => ["${ipaddress_eth1}", ] }
}