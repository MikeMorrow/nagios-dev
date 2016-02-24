apt-get update
apt-get install apache2 -y
apt-get install xinetd -y
apt-get install check-mk-agent -y
/bin/cp /vagrant/conf/check_mk/check-mk-agent /etc/xinetd.d/
service xinetd restart

export DEBIAN_FRONTEND=noninteractive
apt-get install gdebi-core -y
wget http://files.omdistro.org/releases/debian_ubuntu/omd-1.20.trusty.amd64.deb
gdebi -n omd-1.20.trusty.amd64.deb
a2enmod proxy_http
omd create dev
su - dev -c "omd start"
/bin/cp /vagrant/conf/check_mk/main.mk /opt/omd/sites/dev/etc/check_mk
/etc/init.d/apache2 restart






# ---------------------------------------------------------------------------
# Install mariadb
# ---------------------------------------------------------------------------
#export DEBIAN_FRONTEND=noninteractive
#apt-get install mariadb-server -y
#echo -e "\n\nsecret\nsecret\n\n\nn\n\n " | mysql_secure_installation 2>/dev/null


# wget http://files.omdistro.org/releases/debian_ubuntu/omd-1.20.trusty.amd64.deb
# export DEBIAN_FRONTEND=noninteractive
# apt-get install dialog xinetd build-essential apache2 libapache2-mod-python
# apt-get install nagios3 nagios-nrpe-plugin
# echo "vagrant" | htpasswd -i /etc/nagios3/htpasswd.users nagiosadmin
# usermod -a -G nagios www-data
# sed -i 's/check_external_commands=0/check_external_commands=1' /etc/nagios3/nagios.cfg
# service apache2 restart
# service nagios3 restart
