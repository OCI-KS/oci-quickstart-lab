#!/usr/bin/env bash


#wget https://github.com/snafuz/oci-quickstart-lab/archive/master.zip
#unzip master.zip
#cd oci-quickstart-lab-master
#sudo quickstart-setup.sh

SRC_DIR=/var/tmp/quickstart

mv ./quickstart.conf /etc/httpd/conf.d/
mv ./* /var/www/quickstart/
chown root:root -R /var/www/quickstart

yum install httpd mod_wsgi
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
pip install flask flask-socketio gevent

#semanage fcontext -a -t httpd_sys_rw_content_t '/path/to/your/app(/.*)?'
#restorecon -R -v /var/www/quickstart/
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --reload

systemctl enable httpd
systemctl restart httpd
