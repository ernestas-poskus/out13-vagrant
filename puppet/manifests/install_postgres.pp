# --- PostgreSQL ---------------------------------------------------------------
#
# @Provider: https://github.com/ernestas-poskus/puppet-postgresql
#

class install_postgres 
{

	class {'postgresql::server':
    	# acl    => ['host all all 192.168.0.0/16 trust', ],
    	locale => 'es_US.UTF-8',
	}

	pg_user {'rail':
	    ensure     => present,
	    password   => 'rail',
	    createdb   => true,
	    createrole => true,
	}
	# ->
	# pg_database { ['rail_development', 'rail_production', 'rail_test']:
	#     ensure   => present,
	#     owner    => 'rail',
	#     require  => Pg_user['rail'],
	# }



}