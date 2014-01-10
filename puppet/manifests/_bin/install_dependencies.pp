# --- Install dependencies ---------------------------------------------------------

class install_dependencies 
{
	$depending_packages = ['build-essential', 'curl', 'wget', 'git-core', 'autoconf', 'openssl', 'automake', 'libtool', 'pkg-config', 'bison', 'ncurses-dev' ]
	$depending_libraries = ['libreadline6', 'libreadline6-dev', 'zlib1g-dev', 'libssl-dev', 'libyaml-dev', 'libxml2-dev', 'libxslt-dev', 'libc6-dev']
	$sqlite_libraries = ['libsqlite3-0', 'libsqlite3-dev', 'sqlite3']
	$install_tools = ['htop'] # htop - process monitoring
	

	package { $depending_packages: ensure => "installed" }
	package { $depending_libraries: ensure => "installed" }
	# package { $sqlite_libraries: ensure => "installed" }
	# package { $install_tools: ensure => "installed" }
}

