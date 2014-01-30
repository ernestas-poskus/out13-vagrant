# --- Puppet Setup  ---------------------------------------------------------------
#
# @Provider: https://github.com/ernestas-poskus/puppet-postgresql
#

class  install_puppet {

    apt::source { 'puppetlabs':
        location   => 'http://apt.puppetlabs.com',
        repos      => 'dependencies',
        key        => '4BD6EC30',
        key_server => 'pgp.mit.edu',
    }

    # puppet
    package {
        ['puppet', 'libaugeas-ruby']:
            ensure => latest;
    }
}