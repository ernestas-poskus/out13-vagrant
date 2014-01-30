# --- Installing SQLite ---------------------------------------------------------------
#


class install_sqlite 
{
    $sqlite_libraries = ['libsqlite3-0', 'libsqlite3-dev', 'sqlite3']

    package { $sqlite_libraries:
        ensure => present,
        require => Exec['aptupdate'],
    }
}