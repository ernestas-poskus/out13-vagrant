# --- Initialize Puppet Manifests ---------------------------------------------------------

Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
# File {
#     owner => 0,
#     group => 0,
#     mode => 0644
# }

import 'nodes.pp'