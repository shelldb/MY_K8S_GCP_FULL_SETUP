# MY_K8S_GCP_FULL_SETUP
Project created to install and configure Kubernetes with one single script

Setup Information..
master.sh script deploy for you Kubernetes cluster (please change argument passing in compute.py to create number of node cluster
for example if you want two worker node pass the value 3.
master.sh also contains jenkins.sh which will do setup of Jenkins for you.

Steps.
1. Script only desined for Google Cloud, it will not run on any other platform
2. pull the git repository to your google cloud shell (or having well configured SDK)
3. just run master.sh (it will create, Kubernetes Cluser along with helm & tiller, and Jenkins (you have to continue graphical
part of Jenkins)

for Jenkins..
1. get the public IP of the jenkins node and open the url http://public-ip:8080  {make sure firewall is open for 8080 port else it wont work, if not open please open it under vpc/firewall section}
2. Follow the installation instruction displayed on UI { installed latest plugin}
Make sure you have installed ssh plugin, if not installed it under plugin configuration sections

 
create a free style project

in git configuration section add.. git repo url https://github.com/shelldb/MY_K8S_GCP_FULL_SETUP

in built enviornment 

Execute shell script on remote host using ssh

whoami
pwd
cd rm -rf MY_K8S_GCP_FULL_SETUP
sudo yum install -y git
git clone https://github.com/shelldb/MY_K8S_GCP_FULL_SETUP.git

In Bui;ld sectiom

cd MY_K8S_GCP_FULL_SETUP
chmod +x guestbook.sh
sudo ./guestbook.sh
sudo kubectl get pods
