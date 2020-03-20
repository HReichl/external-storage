#!/bin/bash

git clone https://github.com/HReichl/external-storage.git
cd external-storage/nfs-client/deploy/objects
git checkout linuxacademy

oc create -f project.yaml
oc project nfs-client-provisioner
oc create -f serviceaccount.yaml -n nfs-client-provisioner
oc create -f clusterrole.yaml -n nfs-client-provisioner
oc create -f role.yaml -n nfs-client-provisioner
oc create -f clusterrolebinding.yaml -n nfs-client-provisioner
oc create -f rolebinding.yaml -n nfs-client-provisioner
oc create -f class.yaml -n nfs-client-provisioner
oc adm policy add-scc-to-user hostmount-anyuid -z nfs-client-provisioner -n nfs-client-provisioner
sleep 10
oc create -f deployment.yaml -n nfs-client-provisioner

