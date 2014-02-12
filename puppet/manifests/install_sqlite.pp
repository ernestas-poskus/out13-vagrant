# --- Installing SQLite ---------------------------------------------------------------
#


class install_sqlite 
{
    $sqlite_libraries = ['sqlite3', 'libsqlite3-dev', ]

    package { $sqlite_libraries:
        ensure => present,
        require => Exec['out_apt_update'],
    }
}