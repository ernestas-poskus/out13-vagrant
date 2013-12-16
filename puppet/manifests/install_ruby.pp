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
	}
	
	rvm_gem {
	  'bundler':
		name => 'bundler',
		ruby_version => $rubyversion,
		ensure => latest,
		require => Rvm_system_ruby[$rubyversion];
	}
	
	rvm_gem {
	  'rails':
		name => 'rails',
		ruby_version => $rubyversion,
		ensure => $railsversion,
		require => Rvm_system_ruby[$rubyversion];
	}
}