# --- Nodes ---------------------------------------------------------------------


node default 
{ 
	# Puppet & dependencies
	import 'install_puppet.pp'
	require install_puppet

	# Manages packages, runs services, handles configuration
	include monit

	# RVM / Ruby / Rails
	import 'install_ruby.pp'
	include install_ruby
} 


# Vagrant Ruby Development Node
node vagrant-ruby-dev inherits default {

 	# Web Server
	import 'install_nginx.pp'
	include install_nginx
	
	# Manages packages, runs services, handles configuration
	include monit
	
	# Databases
    # import 'install_mysql.pp'
	#	include install_mysql
	import 'install_postgres.pp'
		include install_postgres
	
	# NPM / Node.js
	include nodejs
	
	# NoSQL
	# import 'install_memcached.pp'
	#	include install_memcached
	import 'install_redis.pp'
		include install_redis
	import 'install_mongodb.pp'	
		include install_mongodb
}


