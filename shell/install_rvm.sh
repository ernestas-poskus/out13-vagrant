 #!/usr/bin/env bash
RUBY_VERSION="$1"


echo 'Installing RVM'
bash < <(curl -sk https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer ) # RVM as multi-user

cd && echo "[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm"" >> .bashrc
source /usr/local/rvm/scripts/rvm
type rvm | head -n1


echo 'Checking RVM requirements'
rvm requirements


echo 'Installing Ruby'
rvm install $RUBY_VERSION
rvm use $RUBY_VERSION --default  
echo "gem: --no-rdoc --no-ri" >> /etc/gemrc