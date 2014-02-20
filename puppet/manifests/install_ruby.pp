# --- Ruby Setup ---------------------------------------------------------------
#
# @Provider: https://github.com/blt04/puppet-rvm
#


class install_ruby($ruby_only = false, $gems = [], $username = 'vagrant') 
{
	include rvm

	rvm::system_user { $username: ; }

	rvm_system_ruby { $ruby_version_install:
		ensure => 'present',
		default_use => true;
	}

	if !$ruby_only 
	{
		rvm_gem { $gems:
			ruby_version => $ruby_version_install,
			ensure => latest,
			require => Rvm_system_ruby[$ruby_version_install];
		}
  }
}