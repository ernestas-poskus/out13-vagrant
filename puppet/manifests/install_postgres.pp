# --- PostgreSQL ---------------------------------------------------------------
#
# @Provider: git@github.com:ernestas-poskus/puppet-postgresql.git
#

class install_postgres 
{

	$db_user = 'vag'

	class {'postgresql': }
	class {'postgresql::server':
		version => '9.1',
	}->
	pg_user { $db_user:
    	ensure   => present,
    	password => $db_user,
	}->
	pg_database {'rails_db1':
	    ensure   => present,
	    owner    => $db_user,
	    encoding => 'UTF8',
    	locale   => 'en_US.UTF-8',
	    require  => Pg_user[$db_user],
	}
}

