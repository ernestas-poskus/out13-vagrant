# --- Install Nginx ---------------------------------------------------------------------
#
# @Provider: https://github.com/jfryman/puppet-nginx
#

class install_nginx {

	include nginx

    file { '/etc/nginx/conf.d/include-sites.conf':
        ensure => file,
        content => 'include /etc/nginx/sites-available/*;',
        notify => Class['nginx::service'],
    }
	
}
