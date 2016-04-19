yum update -y
yum install epel-release -y
yum install xinetd -y
# ---------------------------------------------------------------------------
# Install agent
# ---------------------------------------------------------------------------
/bin/cp /vagrant/conf/check_mk/livestatus /etc/xinetd.d/
# ---------------------------------------------------------------------------
# Start and enable xinetd, dependency of check_mk
# ---------------------------------------------------------------------------
systemctl start xinetd.service
systemctl restart xinetd.service
systemctl enable xinetd.service
