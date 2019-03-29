#!/bin/bash

#Deploy SQL 2019 big data cluster CTP2.3
yum install -y centos-release-scl
yum install -y rh-python36
source /opt/rh/rh-python36/enable

pip3 install --upgrade pip

pip3 install -r https://private-repo.microsoft.com/python/ctp-2.3/mssqlctl/requirements.txt

#Setup local volume dtorage class
kubectl apply -f ~/local-storage-provisioner.yaml

#Install SQL 2019 BDC 
export ACCEPT_EULA=Yes
export CLUSTER_PLATFORM=kubernetes
export USE_PERSISTENT_STORAGE=true
export STORAGE_CLASS_NAME=local-storage
export CONTROLLER_USERNAME=admin
export CONTROLLER_PASSWORD=P@ssw0rd
export KNOX_PASSWORD=P@ssw0rd
export MSSQL_SA_PASSWORD=P@ssw0rd
export DOCKER_REGISTRY=private-repo.microsoft.com
export DOCKER_REPOSITORY=mssql-private-preview
export DOCKER_USERNAME=kevinwang@quantatw.com
export DOCKER_PASSWORD=dmnftnkc96dr
export DOCKER_EMAIL=kevinwang@quantatw.com
export DOCKER_PRIVATE_REGISTRY="1"

mssqlctl cluster create -n sqlctp

