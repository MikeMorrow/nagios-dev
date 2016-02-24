# It is assumed that installNagiosServer.sh has been run
export modPythonSource=http://dist.modpython.org/dist/mod_python-3.5.0.tgz
export checkMKrpm=https://mathias-kettner.de/support/1.2.6p16/check-mk-raw-1.2.6p16-el7-34.x86_64.rpm
# ---------------------------------------------------------------------------
# Install httpd with mod_python
# ---------------------------------------------------------------------------
yum install httpd httpd-devel python-devel -y
yum groupinstall "Development Tools" -y
cd /tmp
curl -L -O ${modPythonSource}
tar zxf mod_python-*.tgz
cd mod_python-*
./configure -with-apxs=/usr/bin/apxs
patch ./src/Makefile /vagrant/conf/mod_python/Makefile.patch
patch ./dist/version.sh /vagrant/conf/mod_python/version.sh.patch
make
make install
/bin/cp /vagrant/conf/httpd/01-mod_python.conf /etc/httpd/conf.modules.d/
# ---------------------------------------------------------------------------
# Install check_mk
# ---------------------------------------------------------------------------
yum install check-mk-agent check-mk check-mk-multisite -y
sed -i "s|/etc/nagios/htpasswd.users|/etc/nagios/passwd|" /etc/httpd/conf.d/zzz_check_mk.conf
# ---------------------------------------------------------------------------
# Fix check_mk errors.... still broken
# ---------------------------------------------------------------------------
echo "rrd_path		    = '/var/lib/check_mk/rrd' " >> /usr/share/check_mk/web/htdocs/defaults.py
mkdir -p /var/lib/check_mk/rrd
chown -R apache.nagios /var/lib/check_mk
#chmod 755 /var/lib/check_mk/*
chcon --reference /var/lib/check_mk/autochecks /var/lib/check_mk/rrd
systemctl restart httpd
chmod 770 /etc/check_mk/conf.d/wato/
chown -R apache.nagios /etc/check_mk/
sed -i "s|/etc/nagios/htpasswd.users|/etc/nagios/passwd|" /usr/share/check_mk/modules/defaults
sed -i "s|/etc/nagios/htpasswd.users|/etc/nagios/passwd|" /usr/share/check_mk/web/htdocs/defaults.py
chmod 644 /etc/nagios/passwd
mkdir /var/log/nagios/rw
touch /var/log/nagios/rw/live
chown -R nagios.nagios /var/log/nagios/rw/
