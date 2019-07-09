#!/bin/bash 

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


