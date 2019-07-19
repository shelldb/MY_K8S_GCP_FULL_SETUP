import os
import sys
import subprocess



# Function Started for Kubernetes Cluster Creation

def compute_instance(n):
    print(n)
    n = n + 1

    for i in range(1, n):
        print(i)
        cmd1 = ("gcloud compute instances create stark" + str(i) + " --machine-type n1-highcpu-2  --image centos-7-v20190619  --image-project centos-cloud  --boot-disk-type pd-ssd   --boot-disk-size 10GB " )
        os.system("gcloud config set compute/zone asia-east1-a")
        os.system(cmd1)

       #Condition to choose which is master and which is Worker
        if 1 == i:
            label = "master"
            instance = ("stark" + str(i) )
            print(label, instance)

        elif ( i > 1 & i <= n):
           label = "worker"
           instance = ("stark" + str(i))
           print(label, instance)

        if label == "master":
                #cmd2 = ("glcloud compute ssh stark" + str(i) + "-- 'sudo yum install httpd'")
                
                #print(cmd2)
                #os.system("sh env_master_setup.sh", instance)
                subprocess.call(['bash', 'env_master_setup.sh', instance])
        elif label == "worker":
            #cmd2 = ("glcloud compute ssh stark" + str(i) + "-- 'sudo yum install nginx'")
            #print(cmd2)
            subprocess.call(['bash', 'env_worker_setup.sh', instance])


compute_instance(2)
