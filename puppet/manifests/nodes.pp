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
	
	# Databases
	import 'install_postgres.pp'
		include install_postgres
    # import 'install_mysql.pp'
	#	include install_mysql
	
	# NPM / Node.js
	include nodejs
	
	# NoSQL
	# import 'install_memcached.pp'
	#	include install_memcached
	import 'install_mongodb.pp'	
		include install_mongodb
	import 'install_redis.pp'
		include install_redis

}


