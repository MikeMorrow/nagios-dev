apt-get update
apt-get install xinetd -y
apt-get install check-mk-agent -y
/bin/cp /vagrant/conf/check_mk/check-mk-agent /etc/xinetd.d/
service xinetd restart
