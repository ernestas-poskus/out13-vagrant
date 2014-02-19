# --- Elasticsearch Setup ---------------------------------------------------------------
#
# @Provider: https://github.com/elasticsearch/puppet-elasticsearch
# @Wiki: https://github.com/richardwilly98/elasticsearch-river-mongodb/wiki
#

class install_elasticsearch($ip = '127.0.0.1', $elastic_gem = false) 
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

	if $elastic_gem
	{
		rvm_gem { 'elasticsearch_gem':
			name 					=> 'elasticsearch',
			ruby_version 	=> $ruby_version_install,
			ensure 				=> latest,
		}
	}

	# elasticsearch::plugin{'elasticsearch/elasticsearch-mapper-attachments/2.0.0.RC1':
 #  	module_dir => 'mapper'
 # 	}

	# elasticsearch::plugin{'river': # elasticsearch-mapper-attachments
	# 	module_dir 		=> 'river',
	# 	url 					=> 'https://github.com/richardwilly98/elasticsearch-river-mongodb'
	# }

}

