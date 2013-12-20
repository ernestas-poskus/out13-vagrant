# --- Initialize Puppet Manifests ---------------------------------------------------------

Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
File {
    owner => 0,
    group => 0,
    mode => 0644
}

# --- Preinstall Stage ---------------------------------------------------------

# stage { 'preinstall': }
# Stage['preinstall'] -> Stage['main']

# import 'update_system.pp'
# import 'nodes.pp'

# class{ ['update_system']:
#   stage => preinstall
# }








