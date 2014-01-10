# --- RVM / Ruby / Rails --------------------------------------------------------------------
#
# @Provider: git://github.com/blt04/puppet-rvm
#

class install_ruby () {

	$username = 'vagrant'
	$rubyversion = '2.0.0-p353'
	$railsversion = '4.0.2'

	include rvm
	
	rvm::system_user { $username: ; }

	rvm_system_ruby {
		$rubyversion:
		ensure => 'present',
		default_use => true;
	}->
	exec { "/usr/local/rvm/bin/rvm requirements": }->
	exec { "/usr/local/rvm/bin/rvm rubygems current":}->

	rvm_gem { 'bundler':
		name => 'bundler',
		ruby_version => $rubyversion,
		ensure => latest,
		require => Rvm_system_ruby[$rubyversion];
	}
	# rvm_gem { 'puppet_and_libaugeas':
	# 	name => ['puppet', 'libaugeas-ruby'],
	# 	ruby_version => $rubyversion,
	# 	ensure => latest,
	# 	require => Rvm_system_ruby[$rubyversion];
	# }
	
	# Ruby Web Server
	rvm_gem { 'passenger':
		name => 'passenger',
		ruby_version => $rubyversion,
		ensure => latest,
		require => Rvm_system_ruby[$rubyversion];
	}->
	exec { '/usr/local/rvm/bin/rvm passenger-install-nginx-module': }

	rvm_gem { 'rails':
		name => 'rails',
		ruby_version => $rubyversion,
		ensure => $railsversion,
		require => Rvm_system_ruby[$rubyversion];
	}


}