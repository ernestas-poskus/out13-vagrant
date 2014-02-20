# --- PostgreSQL ---------------------------------------------------------------
#
# @Provider: https://github.com/ernestas-poskus/puppet-postgresql
#


class install_postgres($ip = "${postgresql_port}")
{
		class {'postgresql::server': 
			listen 				=> "*",
 	  	port   			=> $ip,
 	  	acl    			=> ['host all all 192.168.130.1/32 trust', ],
		}
		->
		pg_user {'vagrant':
	    ensure     	=> present,
	    password   	=> 'vagrant',
	    superuser  	=> true,
	    createdb   	=> true,
	    createrole 	=> true,
		}
		->
		pg_user {'rail':
	    ensure     	=> present,
	    password   	=> 'rail',
	    superuser  	=> false,
	    createrole 	=> false,
	    createdb   	=> true,
		}
		->
		pg_database {'template13':
	    ensure   		=> present,
	    owner    		=> 'vagrant',
	    encoding 		=> 'UTF8',
	    locale   		=> 'en_US.UTF-8',
	    require  		=> Pg_user['vagrant'],
	    template 		=> 'template0', # Parent Template, template0 allows overridding encoding/locale
		}
}


class install_postgres::client($pg_gem = false)
{
	class { 'postgresql::client': }	

	if $pg_gem
	{
		rvm_gem { 'pg_gem':
			name 					=> 'pg',
			ruby_version 	=> $ruby_version_install,
			ensure 				=> latest,
			require 			=> Class['postgresql::client'];
		}
	}
}