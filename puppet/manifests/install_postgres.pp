# --- PostgreSQL ---------------------------------------------------------------
#
# @Provider: git@github.com:puppetlabs/puppetlabs-postgresql.git
#

class install_postgres {

	class { 'postgresql::server':
	  ip_mask_allow_all_users    => '192.168.0.0/16',
	  listen_addresses           => '*',
	  ipv4acls                   => ['hostssl all johndoe 192.168.0.0/16 cert'],
	  manage_firewall            => true,
	  postgres_password          => 'root',
	}
	
}