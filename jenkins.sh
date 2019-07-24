#! /bin/bash

gcloud config set compute/zone asia-east1-a
gcloud compute instances create jenkins	 --machine-type f1-micro  --image centos-7-v20190619  --image-project centos-cloud  --boot-disk-type pd-ssd   --boot-disk-size 10GB

gcloud compute ssh jenkins -- "sudo sed -i 's/PasswordAuthentication[[:space:]]no/PasswordAuthentication yes/g' /etc/ssh/sshd_config"
#gcloud compute ssh jenkins -- "sudo sed -i 's/PasswordAuthentication[[:space:]]no/PasswordAuthentication[[;space:]] yes/' /etc/ssh/sshd_config"
gcloud compute ssh jenkins -- 'sudo systemctl restart sshd'
gcloud compute ssh jenkins -- 'sudo useradd k8test'
gcloud compute ssh jenkins -- "echo -e 'smurf123\nsmurf123' | sudo passwd k8test"
gcloud compute ssh jenkins -- 'sudo usermod -G google-sudoers `whoami`'
gcloud compute ssh jenkins -- 'sudo mkdir `pwd`/setup_files'
gcloud compute ssh jenkins -- 'sudo chmod 777 ~/setup_files'
gcloud compute scp `pwd`/jenkins_install.sh jenkins:~/setup_files
gcloud compute ssh jenkins -- 'cd  ~/setup_files && sudo sh jenkins_install.sh'
