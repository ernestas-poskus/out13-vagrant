# --- Nodes ---------------------------------------------------------------------

# Default Node for Global VM dependencies
node default
{ 
	import 'helpers/add_user.pp'
	import 'helpers/install_tools.pp'

	stage { 'preinstall':
	  before => Stage['main']
	}

	import 'out_system.pp'

	class{ ['out_system']: 
	  stage => preinstall
	}
} 


# Main Node for Rails development
node 'main' inherits default
{
	import 'install_nginx.pp'
	import 'install_ruby.pp'
	import 'install_nodejs.pp'


	#
	# => Chained because installing order matters
	# => 1. Node.js (Rails require node)
	# => 2. Ruby ( Nginx passenger binds to RVM wrapper)
	#
	class {'install_nodejs':  
		npm_package => ['coffee-script',] 
	}
	->
	class {'install_ruby':
		gems 			=> ['bundler', 'rails', ] 
	}
	->
	class { 'install_nginx': }
	

	import 'install_redis.pp'
	class { 'install_redis':
		redis_gem 		=> true
	}
		

	import 'install_mongodb.pp'
	class { 'install_mongodb': 
		client_only 	=> true, 
		mongo_orm_gem 	=> true
	} 
	
	class { 'install_tools': }

	# import 'install_postgres.pp'
	# class { 'install_postgres': 
	# 	client_only 	=> true, 
	# 	pg_gem 			=> true,
	# }
}


# Node.js Node for JavaScript applications
node 'js' inherits default 
{
	import 'install_mongodb.pp'
	class { 'install_mongodb': 
		ips => ['127.0.0.1', ]
	}

	import 'install_nodejs.pp'
	class {'install_nodejs':
		npm_package => [
			'mongodb', 'commander', 'coffee-script', 'underscore',
		]
	}
}


# Python Node for Python/Django applications
node 'py' inherits default 
{
	import 'install_python.pp'
	class { 'install_python': }

	import 'install_mongodb.pp'
	class { 'install_mongodb': 
		ips => ['127.0.0.1', ]
	}
}


# DB Vagrant instance 
node 'db' inherits default
{
	import 'install_postgres.pp'
	include install_postgres

	import 'install_mongodb.pp'
	include install_mongodb
}