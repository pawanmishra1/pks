#!/bin/bash 

##  Set hosts file

echo "192.168.61.102  pks.emcdigital.lab      pks.emcdigital.lab" >> /etc/hosts

## Set Cluster info
echo "192.168.61.103  pks-lab-cluster.emcdigital.lab  pks-lab-cluster"  >> /etc/hosts


##  Setup pks login
   pks login -a pks.emcdigital.lab -u appmod -p Password@123 -k

##Delete PKS Cluster
    pks delete-cluster pks-lab-cluster --non-interactive --wait

##  Create PKS Cluster
   pks create-cluster pks-lab-cluster --external-hostname pks-lab-cluster.emcdigital.lab --plan small --num-nodes 3 --wait

## Get PKS cluster Details
  pks get-credentials pks-lab-cluster 

#  - name: Get PKS Cluster configuration
#    command: "'KUBECONFIG=cluster.config' pks get-credentials pks-lab-cluster "

## Setup cluster details
  kubectl config use-context pks-lab-cluster

## Print cluster details
  kubectl cluster-info


