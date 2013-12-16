require 'git'

repo = {
	'apt' 		=> 'git://github.com/puppetlabs/puppetlabs-apt.git', # provides a simple interface for managing APT source, key, and definitions with Puppet.
	'stdlib' 	=> 'git://github.com/puppetlabs/puppetlabs-stdlib.git', # module that can construct files from fragments. 
	'concat' 	=> 'git://github.com/puppetlabs/puppetlabs-concat.git', # module that can construct files from fragments. 
	'monit' 	=> 'git://github.com/salimane/puppet-monit.git', # provides a simple way to install the package, run the service, and handle the configuration
	'wget' 		=> 'git://github.com/maestrodev/puppet-wget.git', # module to download files with wget, supporting authentication.
	'ntp' 		=> 'git://github.com/puppetlabs/puppetlabs-ntp', # handles running NTP across a range of operating systems and distributions.
	'rvm' 		=> 'git://github.com/blt04/puppet-rvm', # Ruby Version Management
	
	'nginx'		=> 'git://github.com/jfryman/puppet-nginx', # Web Server
	'nodejs' 	=> 'git://github.com/willdurand/puppet-nodejs.git',
	'sqlite'	=> 'git://github.com/puppetlabs/puppetlabs-sqlite',
	'redis'		=> 'git://github.com/fsalum/puppet-redis',
	'postgresql'=> 'git://github.com/akumria/puppet-postgresql',
	'mysql' 	=> 'git://github.com/puppetlabs/puppetlabs-mysql.git',
	'memcached' => 'git://github.com/saz/puppet-memcached.git',
	'mongodb' 	=> 'git://github.com/puppetlabs/puppetlabs-mongodb.git',
	'cassandra' => 'git://github.com/gini/puppet-cassandra.git',
}
cwd = File.join(Dir.pwd, "modules")

repo.each do |name, repository|
  puts "Cloning #{name}, from #{repository}"
  Git.clone(repository, name, :path => cwd )
end