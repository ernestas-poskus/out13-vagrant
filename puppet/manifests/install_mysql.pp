# --- MySQL --------------------------------------------------------------------


class install_mysql {

	include '::mysql::server'
}


# https://github.com/puppetlabs/puppetlabs-mysql