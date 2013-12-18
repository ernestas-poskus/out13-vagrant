# --- Nodes ---------------------------------------------------------------------


node default 
{ 
	# Puppet & dependencies
	import 'install_puppet.pp'
	include install_puppet

	# Manages packages, runs services, handles configuration
	include monit 

	# RVM / Ruby / Rails
	import 'install_ruby.pp'
	include install_ruby
} 


# Vagrant Ruby Development Node
node vagrant-ruby-dev inherits default {

 	
	import 'install_nginx.pp'
	import 'install_security.pp'
	# import 'install_mysql.pp'
	import 'install_postgres.pp'
	import 'install_mongodb.pp'
	# import 'install_memcached.pp'
	import 'install_redis.pp'
		

	include install_nginx
	include install_security
	# include install_mysql 
	include install_postgres
	include nodejs
	include install_mongodb
	# include install_memcached
	include install_redis
}


