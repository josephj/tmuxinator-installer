# Forward ports to Vagrant
cd ~/Repos/stackla/bin/ports
./set-vagrant-ports.sh

# Start Vagrant
cd ~/Repos/stackla/stackla-web;
vagrant up;

# Start Mongo
vagrant ssh -c 'sudo /vagrant/bin/mongo/mongodb-start.sh';

# Start nginx
vagrant ssh -c '/vagrant/bin/nginx/restart-nginx-pfm-varnish.sh';

# Start content service
vagrant ssh -c 'cd /vagrant/bin/pm2; ./start-content.sh';

# Make pow work
#vagrant ssh -- -R 20559:localhost:20559

#vagrant ssh -c 'cd /vagrant/stackla-node-content/bin/; ./data-service-start.sh';
#vagrant ssh
 #/vagrant/stackla-web/bin/setup-environment.sh;
 #/vagrant/stackla-superadmin/bin/setup-environment.sh;
 #/vagrant/stackla-web/bin/make_writable_dirs.sh;
 #cd /vagrant/stackla-node-content/bin;
 #./start-pm2-web.sh;
 #sudo /vagrant/bin/mongodb-start.sh;
 #cd /vagrant/stackla-node-content/app;
 #pm2 start pm2-content.json;
 #/vagrant/bin/restart-nginx-pfm-varnish.sh;
 #exit;
#'
#echo 'Wating for 5 secs....'
#sleep 5

## Start Stackla data service
#vagrant ssh -c '
 #cd /vagrant/stackla-node-content/bin;
 #./data-service-start.sh
#'

