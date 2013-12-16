# --- Install Cassandra  ---------------------------------------------------------------------


class install_cassandra  {

	class { 'cassandra':
	  cluster_name => 'outCassandraCluster',
	  seeds        => [ '192.0.2.5', '192.0.2.23', '192.0.2.42', ],
	}
	
}
