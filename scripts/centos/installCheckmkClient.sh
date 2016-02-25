# ---------------------------------------------------------------------------
# Install agent
# ---------------------------------------------------------------------------
yum install check-mk-agent -y
/bin/cp /vagrant/conf/check_mk/check-mk-agent /etc/xinetd.d/
# ---------------------------------------------------------------------------
# Start and enable xinetd, dependency of check_mk
# ---------------------------------------------------------------------------
systemctl start xinetd.service
systemctl enable xinetd.service
#firewall-cmd --add-port=6556/tcp --permanent
#firewall-cmd --reload
