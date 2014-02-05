# --- Python Setup ---------------------------------------------------------------
#
# @Provider: https://github.com/stankevich/puppet-python
#

class install_python 
{

	class { 'python':
		version    => 'system', 
		pip 	   => true, # Python Package manager
		dev        => true, # python-dev
		virtualenv => true, # Virtual Environment
		gunicorn   => true, # HTTP Web Server
	}


	python::pip { 'pymongo': }

	python::pip { 'bottle': }
}