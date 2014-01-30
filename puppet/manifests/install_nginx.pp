# --- Nginx + Passenger Setup ---------------------------------------------------------------
#
# @Provider: https://github.com/jfryman/puppet-nginx
#

class install_nginx 
{

	class { 'nginx':
	  package_source  => 'passenger',
	  http_cfg_append => {
	    'passenger_root' => '/usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini',
	  }
	}


	# 
	# => @help: https://github.com/jfryman/puppet-nginx/blob/master/manifests/resource/vhost.pp
	#
	nginx::resource::vhost { 'rail':
		ensure                 		=> present,
		server_name					=> ['rail'],
		www_root         			=> '/var/www/rail/public',
		listen_port					=> 3000,
		use_default_location 		=> false,

		vhost_cfg_append => {
		    'passenger_enabled' 	=> 'on',
		    'passenger_base_uri' 	=> '/',
		    'passenger_ruby'    	=> "/usr/local/rvm/gems/ruby-${ruby_version_install}/wrappers/ruby", # Using RVM Ruby Wrapper for Passenger
		    'rails_env'				=> 'development', # development / testing / production
	  	},
	}

}