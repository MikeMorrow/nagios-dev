# ---------------------------------------------------------------------------
# Update
# ---------------------------------------------------------------------------
apt-get update
# ---------------------------------------------------------------------------
# Install apache / xinetd / check_mk agent
# ---------------------------------------------------------------------------
apt-get install apache2 -y
apt-get install xinetd -y
apt-get install check-mk-agent -y
/bin/cp /vagrant/conf/check_mk/check-mk-agent /etc/xinetd.d/
service xinetd restart
# ---------------------------------------------------------------------------
# Install OMD
# ---------------------------------------------------------------------------
export DEBIAN_FRONTEND=noninteractive
apt-get install gdebi-core -y
wget --quiet http://files.omdistro.org/releases/debian_ubuntu/omd-1.20.trusty.amd64.deb
gdebi -n omd-1.20.trusty.amd64.deb
# ---------------------------------------------------------------------------
# Enable apache mods
# ---------------------------------------------------------------------------
a2enmod proxy_http
# ---------------------------------------------------------------------------
# Create OMD environment
# ---------------------------------------------------------------------------
omd create dev
su - dev -c "omd start"
/bin/cp /vagrant/conf/check_mk/main.mk /opt/omd/sites/dev/etc/check_mk
/etc/init.d/apache2 restart
su - dev -c "cmk -I" # inventory - find new services
su - dev -c "cmk -R" # precompile + config + core restart
