apt-get update
apt-get install apache2 -y
apt-get install xinetd -y
apt-get install check-mk-agent -y
/bin/cp /vagrant/conf/check_mk/check-mk-agent /etc/xinetd.d/
service xinetd restart

export DEBIAN_FRONTEND=noninteractive
apt-get install gdebi-core -y
wget --quiet http://files.omdistro.org/releases/debian_ubuntu/omd-1.20.trusty.amd64.deb
gdebi -n omd-1.20.trusty.amd64.deb
a2enmod proxy_http
omd create dev
su - dev -c "omd start"
/bin/cp /vagrant/conf/check_mk/main.mk /opt/omd/sites/dev/etc/check_mk
/etc/init.d/apache2 restart
cmk -I # inventory - find new services
cmk -R # precompile + config + core restart
