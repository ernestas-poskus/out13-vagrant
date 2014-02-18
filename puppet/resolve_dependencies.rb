require 'git'

repo = {
	'apt' 					=> 'git://github.com/puppetlabs/puppetlabs-apt.git', # provides a simple interface for managing APT source, key, and definitions with Puppet.
	'stdlib' 				=> 'git://github.com/puppetlabs/puppetlabs-stdlib.git', # module that can construct files from fragments. 
	'concat' 				=> 'git://github.com/puppetlabs/puppetlabs-concat.git', # module that can construct files from fragments. 
	'ntp' 					=> 'git://github.com/puppetlabs/puppetlabs-ntp.git', # handles running NTP across a range of operating systems and distributions.
	'nodejs' 				=> 'git://github.com/puppetlabs/puppetlabs-nodejs.git',
	'mongodb' 			=> 'git://github.com/puppetlabs/puppetlabs-mongodb.git', # NoSQL: MongoDB - Document/ Key <> Value
	'java'					=> 'git://github.com/puppetlabs/puppetlabs-java.git', # Java Runtime
	
	'postgresql'		=> 'git://github.com/ernestas-poskus/puppet-postgresql.git', # Default Database
	'redis'					=> 'git://github.com/fsalum/puppet-redis.git', # NoSQL: Redis - Key <> Value
	'wget' 					=> 'git://github.com/maestrodev/puppet-wget.git', # module to download files with wget, supporting authentication.
	'rvm' 					=> 'git://github.com/blt04/puppet-rvm.git', # Ruby Version Management
	'nginx'					=> 'git://github.com/jfryman/puppet-nginx.git', # Nginx Web Server
	'python'				=> 'git://github.com/stankevich/puppet-python.git', # Python with HTTP server
	'erlang'				=> 'git://github.com/garethr/garethr-erlang.git',
	'memcached' 		=> 'git://github.com/saz/puppet-memcached.git',
	'scala'					=> 'git://github.com/garethr/garethr-scala.git',
	'elasticsearch' => 'git://github.com/elasticsearch/puppet-elasticsearch.git',

	# 'firewall'	=> 'git://github.com/puppetlabs/puppetlabs-firewall.git', # Firewall used to manage and configure firewall rules from within the Puppet DSL
	# 'monit' 	=> 'git://github.com/salimane/puppet-monit.git', # provides a simple way to install the package, monitor, run services, and handle the configuration
}
cwd = File.join(Dir.pwd, "modules")

repo.each do |name, repository|
  puts "Cloning #{name}, from #{repository}"
  Git.clone(repository, name, :path => cwd )
end