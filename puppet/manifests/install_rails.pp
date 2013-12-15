# --- Rails --------------------------------------------------------------------


class install_rails ($username = 'vagrant',  $rubyversion = '2.0.0-p247', $railsversion = '4.0.2') {

    $home_dir    = "/home/${username}"
	
	import 'install_ruby.pp'
	
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
		ensure => railsversion,
		require => Rvm_system_ruby[$rubyversion];
	}
	
}


