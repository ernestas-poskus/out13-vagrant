# --- Nodes ---------------------------------------------------------------------


node vagrant-ruby-dev {

    import 'nodedefault.pp'
    include nodedefault

    $username = 'vagrant'
	$ruby_version = '2.0.0-p247'
	$rails_version = '4.0.2'
	
	
	# RVM / Ruby / Rails
	# import 'install_ruby.pp'
    # class { 'install_ruby':
        # username    => $username,
        # rubyversion =>  $rubyversion,
		# railsversion =>  $rails_version,
    # }
	

}