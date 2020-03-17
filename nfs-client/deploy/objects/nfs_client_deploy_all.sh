#!/bin/bash

git clone https://github.com/HReichl/external-storage.git
cd external-storage/nfs-client/deploy/objects
git checkout linuxacademy

oc create -f project.yaml
oc project nfs-client-provisioner
oc create -f serviceaccount.yaml
oc create -f clusterrole.yaml
oc create -f role.yaml
oc create -f clusterrolebinding.yaml
oc create -f rolebinding.yaml
oc create -f class.yaml
oc adm policy add-scc-to-user hostmount-anyuid -z nfs-client-provisioner
sleep 10
oc create -f deployment.yaml

