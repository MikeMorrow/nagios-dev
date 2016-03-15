# It is assumed that installNagiosServer.sh has been run
export checkMKrpm=https://mathias-kettner.de/support/1.2.6p16/check-mk-raw-1.2.6p16-el7-34.x86_64.rpm

yum install epel-release -y
curl -L -O $checkMKrpm
yum install --nogpgcheck check-mk-raw-1.2.6p16-el7-34.x86_64.rpm -y
/usr/sbin/setsebool httpd_can_network_connect 1
omd create dev
su - dev -c "omd start"
/bin/cp /vagrant/conf/check_mk/main.mk /opt/omd/sites/dev/etc/check_mk
su - dev -c "cmk -I" # inventory - find new services
su - dev -c "cmk -R" # precompile + config + core restart
