#!/usr/bin/env bash

#wget https://github.com/snafuz/oci-quickstart-lab/archive/master.zip
#unzip master.zip
#cd oci-quickstart-lab-master
#sudo ./quickstart-setup.sh

yum install -y httpd mod_proxy_html
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
pip install flask flask-socketio gevent requests

touch /etc/httpd/conf.d/quickstart.conf
cat quickstart.conf > /etc/httpd/conf.d/quickstart.conf

#semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/quickstart(/.*)?'
#restorecon -R -v /var/www/quickstart
/usr/sbin/setsebool -P httpd_can_network_connect 1
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --reload

systemctl enable httpd
systemctl restart httpd

./app.py > stdout.log 2>&1 &
