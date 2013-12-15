# --- MySQL --------------------------------------------------------------------


class install_mysql {

	class { '::mysql::server':
	  root_password    => '',
	  override_options => { 'mysqld' => { 'max_connections' => '1024' } }
	}

}
