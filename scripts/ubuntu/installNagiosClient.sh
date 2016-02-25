# ---------------------------------------------------------------------------
# Update
# ---------------------------------------------------------------------------
yum update -y
yum install epel-release -y
# ---------------------------------------------------------------------------
# Install Nagios client
# ---------------------------------------------------------------------------
yum install nrpe nagios-plugins-all -y
/bin/cp /vagrant/conf/nagios/client/nrpe.cfg /etc/nagios/nrpe.cfg
systemctl restart nrpe
