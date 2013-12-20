# --- Install Nginx ---------------------------------------------------------------------
#
# @Provider: https://github.com/jfryman/puppet-nginx
#

class install_nginx {

	# include nginx
	class { 'nginx':
	  package_source => 'passenger',
	  http_cfg_append => {
	   'passenger_root' => '/usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini',
	  }
	}

    file { '/etc/nginx/conf.d/include-sites.conf':
        ensure => file,
        content => 'include /etc/nginx/sites-available/*;',
        notify => Class['nginx::service'],
    }

	nginx::resource::vhost { 'vagrant_out':
	  ensure => present,
	}
}
