# --- MySQL --------------------------------------------------------------------
#
# @Provider: git://github.com/puppetlabs/puppetlabs-mysql.git
#

class install_mysql {

	include '::mysql::server'
}


# https://github.com/puppetlabs/puppetlabs-mysql