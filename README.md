# Vagrantfile for AET on Docker

##  Overview

The repository contains files required to start locally AET using Alpine Linux and Docker.

## Requirements

Following software is neccessary:

* *Vagrant* , version 2.X.Y
* *Virtual Box* , 5.2.X

## Initiate Vagrant with Docker and AET

| Step no | Description | Command|
|---------|-------------|--------|
|1| Once repository is cloned to local directory, run command line / terminal, navigate into the directory where repository is stored and initiate Vagrant. You may be asked to provide password in order to add entries into hosts file. | `vagrant up` |
|2| Login into VM | `vagrant ssh` |
|3| Run script to install Docker and AET | `sudo /var/tmp/custom/scripts/configure_aet.sh` |
|4| Wait until all replicas are up | `sudo docker ps`|
|5| Run test suite |  `cd /var/tmp/custom/scripts; ./aet.sh http://192.168.59.12:8181`|
|6| Check results in web browser. Use link provided by script and replace localhost with *alpine-sandbox.localhost* , for example: http://alpine-sandbox.localhost/report.html?company=company&project=project&correlationId=company-project-test-suite-1564137251377 |





