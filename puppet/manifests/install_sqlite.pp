# --- Installing SQLite ---------------------------------------------------------------
#


class install_sqlite 
{
  package { ['sqlite3', 'libsqlite3-dev', ]:
    ensure => present,
    require => Exec['out_apt_update'],
  }
}