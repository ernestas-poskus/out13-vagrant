# --- Initialize Puppet Manifests ---------------------------------------------------------


# System dependencies & libraries
import 'out_system.pp'


# Helpers
# import 'helpers/add_user.pp'
import 'helpers/install_tools.pp'
import 'helpers/install_dotfiles.pp'
import 'helpers/install_zsh.pp'


# Importing Vagrant Nodes
import 'nodes.pp'


#
# Setting Globals
#  
Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
File {
	owner => 0,
	group => 0,
	mode => 0755
}


# Spaceship relationship operator updates apt before installing package
Exec['out_apt_update'] -> Package <| |>


# Defining Stages
stage { 'preinstall': before => Stage['main'] }


class { 'out_system::update': stage => preinstall } 
class { 'out_system::install_essential': stage => preinstall }

# Installing Additional Tools
class { 'install_zsh': stage => preinstall }
class { 'install_tools': }
class { 'install_dotfiles': }