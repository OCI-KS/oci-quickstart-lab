#!/usr/bin/env bash

yum install httpd mod_wsgi

mkdir /var/tmp/quickstart
cd /var/tmp/quickstart
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
pip install flask flask-socketio gevent
#wget ...
tar -xvzf quickstart-lab.tgz
mv oci-quickstart-lab/quickstart.conf /etc/httpd/conf.d/

mkdir /var/www/quickstart
mv oci-quickstart-lab/* /var/www/quickstart/

chown root:root -R /var/www/quickstart

#semanage fcontext -a -t httpd_sys_rw_content_t '/path/to/your/app(/.*)?'
#restorecon -R -v /var/www/quickstart/
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --reload

systemctl enable httpd
systemctl restart httpd
