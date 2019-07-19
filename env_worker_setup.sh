#! /bin/bash

gcloud compute ssh $1 -- 'sudo usermod -G google-sudoers vaibhavkhandalkar1118'
gcloud compute ssh $1 -- 'sudo mkdir `pwd`/setup_files'
gcloud compute ssh $1 -- 'sudo chmod 777 ~/setup_files'
gcloud compute scp `pwd`/k8s_installation.sh $1:~/setup_files
gcloud compute ssh $1 -- 'cd  ~/setup_files && sudo sh k8s_installation.sh'
