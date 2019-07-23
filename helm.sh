#! /bin/bash

sudo curl https://storage.googleapis.com/kubernetes-helm/helm-v2.12.3-linux-amd64.tar.gz > ./helm.tar.gz
sudo tar xvf ./helm.tar.gz

cd linux-amd64
sudo mv ./helm /usr/bin
sudo mv ./tiller /usr/bin
sudo helm init 
sudo helm version

