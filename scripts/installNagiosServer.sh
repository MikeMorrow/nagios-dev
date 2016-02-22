yum update -y
yum install epel-release -y
#
export modPythonSource=http://dist.modpython.org/dist/mod_python-3.5.0.tgz
# ---------------------------------------------------------------------------
# Install httpd
# ---------------------------------------------------------------------------
yum install httpd -y
systemctl start httpd
systemctl enable httpd
touch /var/www/html/index.html
#firewall-cmd --permanent --add-service=http
#systemctl restart firewalld
# ---------------------------------------------------------------------------
# Install mariadb
# ---------------------------------------------------------------------------
yum install mariadb-server mariadb -y
systemctl start mariadb
systemctl enable mariadb
echo -e "\n\nsecret\nsecret\n\n\nn\n\n " | mysql_secure_installation 2>/dev/null
# ---------------------------------------------------------------------------
# Install php
# ---------------------------------------------------------------------------
yum install php php-mysql php-gd php-pear -y
cp /vagrant/conf/info.php /var/www/html/info.php
systemctl restart httpd
# ---------------------------------------------------------------------------
# Install nagios
# ---------------------------------------------------------------------------
yum install nagios -y
echo "vagrant" | htpasswd -i /etc/nagios/passwd nagiosadmin
systemctl restart nagios
# ---------------------------------------------------------------------------
# Install nrpe
# ---------------------------------------------------------------------------
yum install nrpe nagios-plugins-nrpe -y
systemctl restart nrpe
systemctl enable nrpe
# ---------------------------------------------------------------------------
# Install base plugins
# ---------------------------------------------------------------------------
# yum install nagios-plugins -y
yum install nagios-plugins-all -y
# ---------------------------------------------------------------------------
# Install PNP4Nagios to analyze performance data
# ---------------------------------------------------------------------------
# yum install pnp4nagios -y
/bin/cp /vagrant/conf/nagios/server/clients.cfg /etc/nagios/conf.d/clients.cfg
systemctl restart nagios
