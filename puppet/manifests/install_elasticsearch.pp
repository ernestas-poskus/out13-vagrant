# --- Elasticsearch Setup ---------------------------------------------------------------
#
# @Provider: https://github.com/elasticsearch/puppet-elasticsearch
# @Wiki: https://github.com/richardwilly98/elasticsearch-river-mongodb/wiki
#


class install_elasticsearch($ip = '127.0.0.1') 
{
	class { 'elasticsearch':
	  java_install 		=> true,
	  package_url 		=> 'https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.0.deb',
	  manage_repo  		=> true,
	}

	elasticsearch::plugin{'hq':
		module_dir 			=> 'hq',
		url 						=> 'https://github.com/royrusso/elasticsearch-HQ/zipball/master',
	}
}