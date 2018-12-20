# OCI Quickstart lab

## Introduction

Quickstart lab script to setup a reactive web application to register students lab completion

## Instructor lab setup

* Provision a compute instance in OCI:

* Connect via ssh and mount the block volume

* Create a _quickstart_ directory in the block volume mount point and make it the current directoty (via cd)
* Run the commands:

```bash
    $ wget https://github.com/snafuz/oci-quickstart-lab/archive/master.zip
    $ unzip master.zip
    $ cd oci-quickstart-lab-master
    $ sudo ./quickstart-setup.sh

```

* Open the url http://<compute_instance_public_ip> in Chrome

* Complete the lab reattaching boot volume and blockvolume to a different shape

* Move in the _quickstart_

* Run the command below to restart the service
```bash
    $ sudo ./quickstart-run.sh

```
* Open the url http://_<compute_instance_public_ip>_/__lab__ in Chrome to check the students completion

## Student lab setup

* Follow the lab guide instruction to provision the compute instance, mount the block volume and install Apache Httpd 
* Connect via ssh
* Run the commands:
```bash
    $ wget https://github.com/snafuz/oci-quickstart-lab/archive/master.zip
    $ unzip master.zip
    $ cd oci-quickstart-lab-master
    $ mv oci-quickstart-lab-master/static/* <www directory setup in the lab>

```
* Open the url http://<compute_instance_public_ip> in Chrome











