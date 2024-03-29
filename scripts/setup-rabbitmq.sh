#!/bin/bash 

##  Set hosts file

echo "192.168.61.102  pks.emcdigital.lab      pks.emcdigital.lab" >> /etc/hosts

## Setup Cluster Info

echo "192.168.61.103  pks-lab-cluster.emcdigital.lab  pks-lab-cluster"  >> /etc/hosts

##  Setup pks login
   pks login -a pks.emcdigital.lab -u appmod -p Password@123 -k


## Get PKS cluster Details
  pks get-credentials pks-lab-cluster


## Setup cluster details
  kubectl config use-context pks-lab-cluster

## Print cluster details
  kubectl cluster-info

## Setup CouchBase Database

kubectl  apply -f resource-pks/app-setup/rabbitmq-deployment.yml

kubectl  apply -f resource-pks/app-setup/rabbitmq-svc.yml

## Get Deployment status

kubectl get pods

