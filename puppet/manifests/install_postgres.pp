# --- PostgreSQL ---------------------------------------------------------------
#
# @Provider: git@github.com:ernestas-poskus/puppet-postgresql.git
#

class install_postgres 
{
	$db_user = 'vagrant'
	$rails_user = 'out'

	class {'postgresql': }
	class {'postgresql::server':
		version => '9.1',
	}->
	
	
	pg_user { $db_user:
    	ensure   => present,
    	password => $db_user,
	}
	pg_user { $rails_user:
    	ensure   => present,
    	password => $rails_user,
	}

	
	pg_database { $db_user:
	    ensure   => present,
	    owner    => $db_user,
	    encoding => 'UTF8',
    	locale   => 'en_US.UTF-8',
	    require  => Pg_user[$db_user],
	}
	pg_database { $rails_user:
	    ensure   => present,
	    owner    => $rails_user,
	    encoding => 'UTF8',
    	locale   => 'en_US.UTF-8',
	    require  => Pg_user[$rails_user],
	}
}

