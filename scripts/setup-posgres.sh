#!/bin/bash 

##  Set hosts file

echo "192.168.61.102  pks.emcdigital.lab      pks.emcdigital.lab" >> /etc/hosts


##  Setup pks login
   pks login -a pks.emcdigital.lab -u appmod -p Password@123 -k



## Setup cluster details
  kubectl config use-context pks-lab-cluster

## Print cluster details
  kubectl cluster-info

## Setup CouchBase Database

kubectl  apply -f app-setup/postgres-configmap.yml

kubectl  apply -f app-setup/postgres-storage.yml

kubectl  apply -f app-setup/postgres-deployment.yml

