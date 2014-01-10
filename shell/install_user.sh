 #!/usr/bin/env bash

echo 'Adding/Changing RVM user/group'
usermod -a -G rvm vagrant
chown -R vagrant:rvm /usr/local/rvm