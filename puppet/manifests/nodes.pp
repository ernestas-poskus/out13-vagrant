# --- Nodes ---------------------------------------------------------------------


node default
{ 

} 


# Vagrant Ruby Development Node
node outdev inherits default 
{
	import 'install_postgres.pp'
	# import 'install_mongodb.pp'
	# import 'install_redis.pp'

	include install_postgres
	# include install_mongodb
	# include install_redis
}


