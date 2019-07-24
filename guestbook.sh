#! /bin/bash

sudo kubectl apply -f https://k8s.io/examples/application/guestbook/redis-master-deployment.yaml
sudo kubectl apply -f https://k8s.io/examples/application/guestbook/redis-master-service.yaml
sudo kubectl apply -f https://k8s.io/examples/application/guestbook/redis-slave-deployment.yaml
sudo kubectl apply -f https://k8s.io/examples/application/guestbook/redis-slave-service.yaml
sudo kubectl apply -f https://k8s.io/examples/application/guestbook/frontend-deployment.yaml
sudo kubectl apply -f https://k8s.io/examples/application/guestbook/frontend-service.yaml

