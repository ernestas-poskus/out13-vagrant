# --- Memcached ----------------------------------------------------------------
#
# @Provider: git://github.com/saz/puppet-memcached.git
#


class install_memcached {
  
  class { 'memcached': 
	max_memory => '10%'
  }
}

# https://github.com/saz/puppet-memcached

# $package_ensure = 'present'
# $logfile = '/var/log/memcached.log'
# $max_memory = false
# $item_size = false
# $lock_memory = false (WARNING: good if used intelligently, google for -k key)
# $listen_ip = '0.0.0.0'
# $tcp_port = 11211
# $udp_port = 11211
# $user = '' (OS specific setting, see params.pp)
# $max_connections = 8192
# $verbosity = undef
# $unix_socket = undef
# $install_dev = false (TRUE if 'libmemcached-dev' package should be installed)
# $processorcount = $::processorcount