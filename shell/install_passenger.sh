 #!/usr/bin/env bash

echo 'Installing Passenger'

# Passenger
gem install passenger

# Passenger pre-configured with Nginx
rvmsudo passenger-install-nginx-module --auto --prefix='/opt/nginx' --auto-download     
 
rvm wrapper 2.0.0 passenger

wget -O nginx_conf.sh https://raw.github.com/ernestas-poskus/out13-vagrant/master/shell/nginx_conf.sh
mv nginx_conf.sh /etc/init.d/nginx
chmod +x /etc/init.d/nginx
/usr/sbin/update-rc.d -f nginx defaults
 
echo "Nginx successfully installed!"
echo "add this section (or similar) to your /opt/nginx/conf/nginx.conf and edit:"
echo
echo "server {"
echo "  listen 3000;"
echo "  server_name yourserver.com;	# you might have to add VM IP and your server_name to Windows hosts" 
echo "  root /vagrant/yourapp/public;"
echo "  passenger_enabled on;"
echo "  passenger_base_uri /;"
echo "  rails_env development; # [development production testing]"
echo "}"
echo    
echo "cd /vagrant/"
echo "rails new yourapp	# rails app name must match nginx root app name"
echo "cd yourapp"
echo "bundle install"
echo 
echo "sudo service nginx start # will start nginx worker process 1worker/host"