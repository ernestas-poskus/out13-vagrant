# --- Security ---------------------------------------------------------------------


class install_security {

	package { ['fail2ban', 'htop', 'molly-guard', 'logwatch']:
		ensure => installed,
	}

}