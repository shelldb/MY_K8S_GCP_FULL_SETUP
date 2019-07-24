#! /bin/bash

gcloud compute ssh $1 -- "sudo sed -i 's/PasswordAuthentication[[:space:]]no/PasswordAuthentication yes/g' /etc/ssh/sshd_config"
gcloud compute ssh $1 -- 'sudo systemctl restart sshd'
gcloud compute ssh $1 -- 'sudo useradd k8test'
gcloud compute ssh $1 -- "echo -e 'smurf123\nsmurf123' | sudo passwd k8test"
gcloud compute ssh $1 -- 'sudo usermod -G google-sudoers vaibhavkhandalkar1118'
gcloud compute ssh $1 -- 'sudo mkdir `pwd`/setup_files'
gcloud compute ssh $1 -- 'sudo chmod 777 ~/setup_files'
gcloud compute scp `pwd`/k8s_installation.sh $1:~/setup_files
gcloud compute scp `pwd`/k8_master_install.sh $1:~/setup_files
gcloud compute scp `pwd`/helm.sh $1:~/setup_files
gcloud compute scp `pwd`/guestbook.sh $1:~/setup_files
gcloud compute ssh $1 -- 'cd  ~/setup_files && sudo sh k8s_installation.sh'
gcloud compute ssh $1 -- 'cd  ~/setup_files && sudo sh k8_master_install.sh'
gcloud compute ssh $1 -- 'cd  ~/setup_files && sudo sh helm.sh'
