# --- Nodes ---------------------------------------------------------------------

# Default Node for Global VM dependencies
node default
{ 
	# import 'helpers/add_user.pp'
	import 'helpers/install_tools.pp'
	import 'helpers/install_zsh.pp'

	stage { 'preinstall':
	  before => Stage['main']
	}

	import 'out_system.pp'

	class{ 'out_system': 
		stage => preinstall
	}
} 


# Main Node for Rails development
node 'main' inherits default
{
	import 'install_nginx.pp'
	import 'install_ruby.pp'
	import 'install_nodejs.pp'
	import 'install_redis.pp'
	import 'install_mongodb.pp'
	import 'install_postgres.pp'

	class { 'out_system::install_essential': }
	->
		class {'install_nodejs':  
		  npm_package => ['coffee-script',] 
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
						class { 'install_mongodb::client': 
						  mongo_orm_gem => true
						} 
						->
							class { 'install_postgres::client': 
								pg_gem => true,
							}

	
	class { 'install_tools': }
	class { 'install_zsh': }
}


# Node.js Node for JavaScript applications
node 'js' inherits default 
{
	import 'install_mongodb.pp'
	import 'install_nodejs.pp'

	class { 'out_system::install_essential': }
	->
		class { 'install_mongodb': 
	  	ips => ['127.0.0.1', ]
		}
		->
			class {'install_nodejs':
			  npm_package => [
			  	'mongodb', 'commander', 'express', 'consolidate', 'bcrypt-nodejs',
			  	'coffee-script', 'underscore', 'swig', 'validator',
			  ]
			}

	class { 'install_tools': }
	class { 'install_zsh': }
}


# Python Node for Python/Django applications
node 'py' inherits default 
{
	import 'install_python.pp'
	import 'install_mongodb.pp'

	class { 'out_system::install_essential': }
	->
		class { 'install_python': }
		->
			class { 'install_mongodb': 
			  ips => ['127.0.0.1', ]
			}

	class { 'install_tools': }
	class { 'install_zsh': }
}


# DB Vagrant instance 
node 'db' inherits default
{
	import 'install_postgres.pp'
	include install_postgres

	import 'install_mongodb.pp'
	include install_mongodb
}
