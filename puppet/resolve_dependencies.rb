require 'git'

repo = {
	'apt' 		=> 'git://github.com/puppetlabs/puppetlabs-apt.git', # provides a simple interface for managing APT source, key, and definitions with Puppet.
	'stdlib' 	=> 'git://github.com/puppetlabs/puppetlabs-stdlib.git', # module that can construct files from fragments. 
	'concat' 	=> 'git://github.com/puppetlabs/puppetlabs-concat.git', # module that can construct files from fragments. 
	'ntp' 		=> 'git://github.com/puppetlabs/puppetlabs-ntp', # handles running NTP across a range of operating systems and distributions.
	'redis'		=> 'git://github.com/fsalum/puppet-redis', # NoSQL: Redis - Key <> Value
	'postgresql'=> 'git://github.com/ernestas-poskus/puppet-postgresql.git', # Default Database
	'mongodb' 	=> 'git://github.com/puppetlabs/puppetlabs-mongodb.git', # NoSQL: MongoDB - Document/ Key <> Value
	# 'wget' 		=> 'git://github.com/maestrodev/puppet-wget.git', # module to download files with wget, supporting authentication.
	# 'monit' 	=> 'git://github.com/salimane/puppet-monit.git', # provides a simple way to install the package, monitor, run services, and handle the configuration
	# 'facter'	=> 'git://github.com/puppetlabs/facter.git',
	# 'nodejs' 	=> 'git://github.com/puppetlabs/puppetlabs-nodejs.git', # Node.js
	# 'firewall'	=> 'git://github.com/puppetlabs/puppetlabs-firewall.git', # Firewall used to manage and configure firewall rules from within the Puppet DSL
	# 'mysql' 	=> 'git://github.com/puppetlabs/puppetlabs-mysql.git',
	# 'sqlite'	=> 'git://github.com/puppetlabs/puppetlabs-sqlite',	
	# 'memcached' => 'git://github.com/saz/puppet-memcached.git',
	# 'cassandra' => 'git://github.com/gini/puppet-cassandra.git',
	# 'rvm' 		=> 'git://github.com/blt04/puppet-rvm', # Ruby Version Management
	# 'nginx'		=> 'git://github.com/jfryman/puppet-nginx', # Web Server	
}
cwd = File.join(Dir.pwd, "modules")

repo.each do |name, repository|
  puts "Cloning #{name}, from #{repository}"
  Git.clone(repository, name, :path => cwd )
end